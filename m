From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 15 Feb 2018 23:16:32 -0200
Subject: [Buildroot] [RFC] testing: add python-crossbar tests
References: <CAGm1_ku_EsWrA-qCxkgg6xe-HkdVLB=x_10BN2fNYDAcKk7eng@mail.gmail.com>
Message-ID: <5a8630f052ad0_2a8f13e76e012768@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Feb 15, 2018 at 11:41 AM, Yegor Yefremov wrote:

[snip]
> 
> I've tried this test locally, but it always timeouts. Even if I
> specify an hour as a timeout.

I confirm that here, both test cases fail by timeout, so it should not be
related to the host.

> 
> If a dependency is missing (like python-bitstring), then the test also
> fails with an expected message, but if all dependencies are met, the
> test doesn't return.
> 
> Any idea?

I have no idea of what causes it or how to fix it.

However I can give you some ideas how to try to debug using the test infra.
I don't know how far you already explored these options, so please forgive me if
I say only obvious things.

1) run the test case locally using -k
2) look at the first line of the -run.log to get the qemu command
3) execute the qemu command and get to the VM prompt
4) check that the import of the module is not broken:
    buildroot login: root
    # python
    Python 3.6.3 (default, Feb 15 2018, 20:46:37) 
    [GCC 4.9.4] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import crossbar
    >>> crossbar.__version__
    '17.6.1-3'
    >>> 
5) check a command that should print the usage
    # python -m crossbar othervalue
    Traceback (most recent call last):
      File "usr/lib/python3.6/site-packages/watchdog/observers/inotify_c.py", line 46, in _load_libc
      File "/tmp/tmp2/o/TestPythonPy3Crossbar/target/usr/lib/python3.6/ctypes/__init__.py", line 348, in __init__
    OSError: File not found
   (omitted lines)

   NOTICE the host path (/tmp/tmp2 is my buildroot dir) being displayed inside
   the target.

6) ctrl+C to kill the VM
7) enter the <test-output>/TestPythonPy3Crossbar dir - this is the build
   directory, so you can do what we know well, for example, enter menuconfig,
   select 'strace', and call make (or do a clean build)
8) run the qemu command again with the new image
    # strace python -m crossbar version
   Wait a few minutes for many messages and look at them. These ones called my
   attention, maybe unrelated to the problem:
   (omitted lines)
    open("/lib//libc.so", O_RDONLY)         = -1 ENOENT (No such file or directory)
    open("/usrlib//libc.so", O_RDONLY)      = -1 ENOENT (No such file or directory)
    open("/lib/libc.so", O_RDONLY)          = -1 ENOENT (No such file or directory)
    open("/lib/libc.so", O_RDONLY)          = -1 ENOENT (No such file or directory)
    open("/usr/lib/libc.so", O_RDONLY)      = -1 ENOENT (No such file or directory)
    open("/usr/X11R6/lib/libc.so", O_RDONLY) = -1 ENOENT (No such file or directory)
    open("/lib//libc.so.6", O_RDONLY)       = -1 ENOENT (No such file or directory)
    open("/usrlib//libc.so.6", O_RDONLY)    = -1 ENOENT (No such file or directory)
    open("/lib/libc.so.6", O_RDONLY)        = -1 ENOENT (No such file or directory)
    open("/lib/libc.so.6", O_RDONLY)        = -1 ENOENT (No such file or directory)
    open("/usr/lib/libc.so.6", O_RDONLY)    = -1 ENOENT (No such file or directory)
    open("/usr/X11R6/lib/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
    write(2, "Traceback (most recent call last"..., 35Traceback (most recent call last):
   (omitted lines)
   See also:
    # find / -name 'libc.so*'
    /lib/libc.so.1
    /lib/libc.so.0
    # ls /lib
    ld-uClibc-1.0.25.so  libatomic.so.1       libc.so.1
    ld-uClibc.so.0       libatomic.so.1.1.0   libgcc_s.so.1
    ld-uClibc.so.1       libc.so.0            libuClibc-1.0.25.so
9) repeat steps 6 to 8 with your favorite debug tools

So... (wild guesses!)
Could it be related to not finding libc?
Could it be related to paths from host leaked to the target?

Also, did you try to rebase the test case to the previous package version just
to know if the behavior is new?

Regards,
Ricardo
