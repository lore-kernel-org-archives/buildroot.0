From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 7 Mar 2017 22:59:35 +0100
Subject: [Buildroot] [PATCH 1/5] support/testing: core testing
 infrastructure
In-Reply-To: <20170305092920.45b60f02@free-electrons.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1486467363-19881-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LXnRWvi3i0B2q1r_gRjgTkyNjXhdSasMLyYiFrr3=RTWg@mail.gmail.com>
 <20170208110556.6a3ed63a@free-electrons.com>
 <CAAXf6LWp4w+1J5MqYp6uOXWvXG3s0+V1qRt0p8jFM4pTv-qatg@mail.gmail.com>
 <dfb7a87b-6580-384d-81fb-e79f97e6b897@lucaceresoli.net>
 <20170305092920.45b60f02@free-electrons.com>
Message-ID: <1782d558-1785-ebc1-ce61-29d305488183@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 05/03/2017 09:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 4 Mar 2017 19:12:44 +0100, Luca Ceresoli wrote:
> 
>> I'm no pythonist at all, so I don't know any of the mentioned
>> infrastructures. But one thing I dislike in the current implementation
>> is the unpleasant way failures are reported.
> 
> Are you talking about:
> 
>  * Failures because there is a syntax error in the test script
> 
>  * Failures of the test itself, because the generated Buildroot system
>    doesn't behave as expected

Is there a way to understand which kind of failure we had?

But my point was mostly about the first part of the process:

$ ./support/testing/run-tests  -d ../br-test-dl -o ../br-test-out -a
[br-test-out/TestPythonBase/2017-03-03 23:22:46] Starting
[br-test-out/TestPythonBase/2017-03-03 23:22:46] Building
[br-test-out/TestPythonBase/2017-03-03 23:27:37] Building done
[br-test-out/TestPythonBase/2017-03-03 23:27:45] Cleaning up
.[br-test-out/TestDropbear/2017-03-03 23:27:46] Starting
[br-test-out/TestDropbear/2017-03-03 23:27:46] Building
[br-test-out/TestDropbear/2017-03-03 23:29:00] Building done
[br-test-out/TestDropbear/2017-03-03 23:29:06] Cleaning up
[...]
F[br-test-out/TestRootfsOverlay/2017-03-03 23:37:13] Starting
[br-test-out/TestRootfsOverlay/2017-03-03 23:37:13] Building
[br-test-out/TestRootfsOverlay/2017-03-03 23:37:27] Building done
[br-test-out/TestRootfsOverlay/2017-03-03 23:37:27] Cleaning up
.[br-test-out/TestSquashfs/2017-03-03 23:37:27] Starting
[br-test-out/TestSquashfs/2017-03-03 23:37:27] Building
[br-test-out/TestSquashfs/2017-03-03 23:39:38] Building done
[br-test-out/TestSquashfs/2017-03-03 23:39:41] Cleaning up
.[br-test-out/TestJffs2/2017-03-03 23:39:41] Starting
[br-test-out/TestJffs2/2017-03-03 23:39:41] Building
[br-test-out/TestJffs2/2017-03-03 23:42:40] Building done
open input file: No such file or directory
[br-test-out/TestJffs2/2017-03-03 23:42:40] Cleaning up

There's a character before each "Starting" line, I guess it's nose2
reporting the test outcome. It seems to be a '.' for success, 'F' or 'E'
for failures. What's the difference between 'E' and 'F'? Can we remove
these characters, which interfere with the rest of the output?

Also, the rest of the output is a bit more verbose than I'd like to
have. Can we have something like:

23:37:13 TestRootfsOverlay           Starting
23:37:13 TestRootfsOverlay           Building
23:37:27 TestRootfsOverlay           Building done
23:37:27 TestRootfsOverlay           Cleaning up
23:37:13 TestFoo                     Starting
23:37:13 TestFoo                     Building
23:37:27 TestFoo                     Building done
23:37:27 TestFoo                     *** FAILED! ***

Or, even better, something similar to the output of
./support/scripts/test-pkg:

    TestRootfsOverlay: OK
                  Foo: run error: assertion "a == b" failed

That's just random ideas...

-- 
Luca
