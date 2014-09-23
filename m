From: Oli Vogt <oli.vogt.pub01@gmail.com>
Date: Tue, 23 Sep 2014 17:39:54 +1200
Subject: [Buildroot] Building buildroot with python (32bit) on 64bit
 ubuntu machine
In-Reply-To: <CACUGKYP70McERSyUD7J2KysYZ7crf6fJ4y46CqSfRPDFNAvoTw@mail.gmail.com>
References: <CACUGKYP70McERSyUD7J2KysYZ7crf6fJ4y46CqSfRPDFNAvoTw@mail.gmail.com>
Message-ID: <CAAwwcmSuLGjmmhaWxyKrfyVaVtMsFr9m9v7aWTFfdOrRiUgf5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John

May bee this is of interest to you:

I build for ARM 32-bit and started working on the new module
python-smbus-cffi a few weeks ago. After running into problems I could not
finish my investigations because of other more urgent work.
Here are the notes I made:

On a 64-bit host: the build/install of python-smbus-cffi fails as follows:
------------
Traceback (most recent call last):
  File "setup.py", line 7, in <module>
    import smbus
  File
"/home/MPSRV01/home/micropoint/projects/linux-sys/buildroot/buildroot.oli/output/build/python-smbus-cffi-0.2/smbus/__init__.py",
line 1, in <module>
    from .smbus import ffi
  File
"/home/MPSRV01/home/micropoint/projects/linux-sys/buildroot/buildroot.oli/output/build/python-smbus-cffi-0.2/smbus/smbus.py",
line 36, in <module>
    ffi = FFI()
  File
"/home/MPSRV01/home/micropoint/projects/linux-sys/buildroot/buildroot.oli/output/target/usr/lib/python2.7/site-packages/cffi/api.py",
line 56, in __init__
    import _cffi_backend as backend
ImportError:
/home/MPSRV01/home/micropoint/projects/linux-sys/buildroot/buildroot.oli/output/target/usr/lib/python2.7/site-packages/_cffi_backend.so:
wrong ELF class: ELFCLASS32
make: ***
[/home/MPSRV01/home/micropoint/projects/linux-sys/buildroot/buildroot.oli/output/build/python-smbus-cffi-0.2/.stamp_built]
Error 1
------------

The problem is that on one hand we have a 64-bit host-python and on the
other hand a 32-bit dll for the target system and 'api.py:56' does not like
different word sizes:
------------
output/host/usr/bin$ file python2.7
python2.7: ELF 64-bit LSB  executable, x86-64, version 1 (SYSV),
dynamically linked (uses shared libs), for GNU/Linux 2.6.24,
BuildID[sha1]=99a8a60d10f743693f46f8a69468385638d2ff79, not stripped
------------
------------
output/target/usr/lib/python2.7/site-packages$ file _cffi_backend.so
_cffi_backend.so: ELF 32-bit LSB  shared object, ARM, EABI5 version 1
(SYSV), dynamically linked, not stripped
------------

On the other hand I'm happy with compiling existing modules for python 2.7
under 64bit Ubuntu 14.04.
I must say that I have installed a fair bit of 32-bit libraries and
applications on my system.

Regards, oli

On 23 September 2014 16:05, John Tobias <john.tobias.ph@gmail.com> wrote:

> Hi,
>
> Does anyone here have successfully compiled python (32bit) on
> buildroot using a 64bit ubuntu machine?.
>
> Regards,
>
> john
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140923/92581258/attachment.html>
