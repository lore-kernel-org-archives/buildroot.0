From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 07 Mar 2017 22:48:21 -0300
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
References: <c49004fb-fb6a-6d25-dc69-030213e868a8@lucaceresoli.net>
Message-ID: <58bf62e588b43_31cb3fbff494d60041725@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Mar 07, 2017 at 08:10 PM, Luca Ceresoli wrote:

> On 07/03/2017 23:09, Thomas Petazzoni wrote:
>> Hello,
>> 
>> On Tue, 7 Mar 2017 22:59:35 +0100, Luca Ceresoli wrote:
>> 
>>>> Are you talking about:
>>>>
>>>>  * Failures because there is a syntax error in the test script
>>>>
>>>>  * Failures of the test itself, because the generated Buildroot system
>>>>    doesn't behave as expected  
>>>
>>> Is there a way to understand which kind of failure we had?
>> 
>> Well the former will give you Python exceptions, the latter will give
>> you a failure of the test itself.
> 
> Oh, sorry for misreading your original e-mail. Yeah, you're right, they
> are clearly different.
> 
> I was speaking about the 2nd point. When a test is syntactically OK it
> should stay so in the future until it's modified. But the test could
> start failing later in time (which is why we want these tests).
> 
>> 
>>> But my point was mostly about the first part of the process:
>>>
>>> $ ./support/testing/run-tests  -d ../br-test-dl -o ../br-test-out -a
>>> [br-test-out/TestPythonBase/2017-03-03 23:22:46] Starting
>>> [br-test-out/TestPythonBase/2017-03-03 23:22:46] Building
>>> [br-test-out/TestPythonBase/2017-03-03 23:27:37] Building done
>>> [br-test-out/TestPythonBase/2017-03-03 23:27:45] Cleaning up
>>> .[br-test-out/TestDropbear/2017-03-03 23:27:46] Starting
>>> [br-test-out/TestDropbear/2017-03-03 23:27:46] Building
>>> [br-test-out/TestDropbear/2017-03-03 23:29:00] Building done
>>> [br-test-out/TestDropbear/2017-03-03 23:29:06] Cleaning up
>>> [...]
>>> F[br-test-out/TestRootfsOverlay/2017-03-03 23:37:13] Starting
>>> [br-test-out/TestRootfsOverlay/2017-03-03 23:37:13] Building
>>> [br-test-out/TestRootfsOverlay/2017-03-03 23:37:27] Building done
>>> [br-test-out/TestRootfsOverlay/2017-03-03 23:37:27] Cleaning up
>>> .[br-test-out/TestSquashfs/2017-03-03 23:37:27] Starting
>>> [br-test-out/TestSquashfs/2017-03-03 23:37:27] Building
>>> [br-test-out/TestSquashfs/2017-03-03 23:39:38] Building done
>>> [br-test-out/TestSquashfs/2017-03-03 23:39:41] Cleaning up
>>> .[br-test-out/TestJffs2/2017-03-03 23:39:41] Starting
>>> [br-test-out/TestJffs2/2017-03-03 23:39:41] Building
>>> [br-test-out/TestJffs2/2017-03-03 23:42:40] Building done
>>> open input file: No such file or directory
>>> [br-test-out/TestJffs2/2017-03-03 23:42:40] Cleaning up
>>>
>>> There's a character before each "Starting" line, I guess it's nose2
>>> reporting the test outcome. It seems to be a '.' for success, 'F' or 'E'
>>> for failures. What's the difference between 'E' and 'F'? Can we remove
>>> these characters, which interfere with the rest of the output?
>> 
>> Don't know, we would need to look at the internals of nose2/unittest to
>> know what's possible. Not sure how much customization is possible here.

Here are some tests. Notice I forced the dropbear test to fail and also I
previously ran the tests keeping the build (-k).

The current output is

$ support/testing/run-tests -d dl -o output -k tests.package
[output/TestPythonBase/2017-03-07 22:21:41] Starting
[output/TestPythonBase/2017-03-07 22:21:47] Cleaning up
.[output/TestDropbear/2017-03-07 22:21:47] Starting
[output/TestDropbear/2017-03-07 22:21:52] Cleaning up
F
======================================================================
FAIL: test_run (tests.package.test_dropbear.TestDropbear)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v2/support/testing/tests/package/test_dropbear.py", line 25, in test_run
    self.assertEqual(exit_code, 1) # make it fail
AssertionError: 0 != 1

Now using 

+++ support/testing/conf/unittest.cfg
@@ -1,5 +1,6 @@
 [unittest]
 plugins = nose2.plugins.mp
+exclude-plugins = nose2.plugins.result

$ support/testing/run-tests -d dl -o output -k tests.package
[output/TestPythonBase/2017-03-07 22:26:31] Starting
[output/TestPythonBase/2017-03-07 22:26:37] Cleaning up
[output/TestDropbear/2017-03-07 22:26:37] Starting
[output/TestDropbear/2017-03-07 22:26:37] Cleaning up

Notice this way we lose the results. But see at the end.

>> 
>>> Also, the rest of the output is a bit more verbose than I'd like to
>>> have. Can we have something like:
>>>
>>> 23:37:13 TestRootfsOverlay           Starting
>>> 23:37:13 TestRootfsOverlay           Building
>>> 23:37:27 TestRootfsOverlay           Building done
>>> 23:37:27 TestRootfsOverlay           Cleaning up
>>> 23:37:13 TestFoo                     Starting
>>> 23:37:13 TestFoo                     Building
>>> 23:37:27 TestFoo                     Building done
>>> 23:37:27 TestFoo                     *** FAILED! ***
>> 
>> Indeed, would be nice.

The left part is straightforward:
+++ support/testing/infra/basetest.py
@@ -38,6 +38,5 @@ class BRTest(unittest.TestCase):
     def show_msg(self, msg):
-        print "[%s/%s/%s] %s" % (os.path.basename(self.__class__.outputdir),
-                                 self.testname,
-                                 datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
-                                 msg)
+        print "{} {:20s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
+                                self.testname,
+                                msg)

$ support/testing/run-tests -d dl -o output -k tests.package
22:27:58 TestPythonBase       Starting
22:28:04 TestPythonBase       Cleaning up
22:28:04 TestDropbear         Starting
22:28:04 TestDropbear         Cleaning up

The result is the part I am not sure how to get working.

>> 
>> The more I think of it, the less I believe re-using the existing
>> "runners" for Python unit tests is useful in our case. It doesn't bring
>> much, and prevents doing the customizations we need.
> 
> I don't know how much effort it would be to write our own test runner.
> It the effort is little, I agree with you.

I use python mainly for tests together to Robot Framework, so I don't know much
about nose2.
I guess we need a plugin to replace the default one:
https://nose2.readthedocs.io/en/latest/plugins/result.html

Maybe there is some plugin out there that already does that.

Regards,
Ricardo
