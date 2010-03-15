From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 15 Mar 2010 09:33:53 +0200
Subject: [Buildroot] setserial fails to build (after uClibc 0.9.30.3
	upgrade?)
In-Reply-To: <87k4teziju.fsf@macbook.be.48ers.dk>
References: <4B9CBD6D.6010606@gmail.com> <87k4teziju.fsf@macbook.be.48ers.dk>
Message-ID: <badfd5ba1003150033n3bc99fc0ofe5123e2c4011bcc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 14, 2010 at 11:42 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:
>
> Hi,
>
> ?Paulius> setserial.c: In function ?print_hayesesp?:
> ?Paulius> setserial.c:362: error: storage size of ?esp? isn?t known
> ?Paulius> setserial.c: In function ?set_hayesesp?:
> ?Paulius> setserial.c:378: error: storage size of ?esp? isn?t known
> ?Paulius> setserial.c:384: warning: incompatible implicit declaration of
> ?Paulius> built-in function ?exit?
> ?Paulius> make[1]: *** [setserial] Error 1
> ?Paulius> make[1]: Leaving directory `/home/paulius/buildroot/output/build/setserial-2.17'
> ?Paulius> make: *** [/home/paulius/buildroot/output/build/setserial-2.17/setserial] Error 2
>
> ?Paulius> Actual problem I see here is not with uClibc, but with setserial.c not including
> ?Paulius> stdlib.h. Due to my very limited time I can't provide fix now...
>
> No, the stdlib.h stuff is only warnings, the error is that it tries to
> use a struct hayes_esp_config because the kernel headers on x86 has the
> TIOCGHAYESESP ioctl defined in asm/ioctls.h (E.G. on ARM it isn't
> defined, and there it builds).
>
> The hayes stuff is for a really ancient driver (which has recently been
> removed by Alan Cox).
>
> As far as I can see, this has nothing to do with uClibc - Did you
> recently change the kernel headers version?

Yes, I switched to 2.6.33

> As for a fix - We could add an #undef TIOCGHAYESESP after include
> <linux/serial.h>, but I would like to know when the problem started first.
>
> --
> Bye, Peter Korsgaard
>
