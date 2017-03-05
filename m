From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:36:50 +0100
Subject: [Buildroot] [PATCH v2 5/5] support/testing: add toolchain tests
In-Reply-To: <58bc8359882ea_6832a0cfd06544b@ultri3.mail>
References: <1488726201-6507-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <58bc8359882ea_6832a0cfd06544b@ultri3.mail>
Message-ID: <20170305223650.296c7225@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 05 Mar 2017 18:30:01 -0300, Ricardo Martincoski wrote:

> and it tries to run it when --all is used:
> ======================================================================
> ERROR: test_run (tests.toolchain.test_external.TestExternalToolchain)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/tmp/testing-v2/support/testing/infra/basetest.py", line 56, in setUp
>     self.b.build()
>   File "/tmp/testing-v2/support/testing/infra/builder.py", line 23, in build
>     cf.write(self.config)
> TypeError: expected a string or other character buffer object
> 
> > +    def test_run(self):  
> 
> I think you could avoid this by renaming this method ...
> 
> https://nose2.readthedocs.io/en/latest/usage.html#naming-tests
> 'Within test modules, nose2 will load tests from unittest.TestCase subclasses,
> and from test functions (functions whose names begin with "test").'
> 
> ... to something like this:
>     def common_check(self):
> ...

Ah, yes, indeed.

Speaking of this, there is one thing I am not entirely happy with: it
would be much nicer if we could split some test cases in multiple
test_<foo>() methods, especially the external toolchain tests.

However, the setUp() and tearDown() methods are called before and after
running *each* test_<foo>() method of the current unit test class. This
is clearly not what we want, as we don't want to rebuild/clean up the
whole Buildroot build for each test_<foo>() method.

I saw we have setUpClass() and tearDownClass(), but these being class
methods, I guess you don't have access to members of the object
instance that will be used. And we access a lot of these through
"self." in setUp() and tearDown().

Do you have an idea?

In addition to this, we will at some point need to allow a test case to
do something special before the build is started, i.e in the middle of
the setUp() logic. Should the specific test case override setUp() in
this case, do its own stuff, and call the parent class setUp() method?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
