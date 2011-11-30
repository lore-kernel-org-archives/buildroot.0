From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 30 Nov 2011 18:48:13 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
 <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
 <001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98>
 <000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98>
 <20111130170450.2f33e6c2@skate>
 <000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98>
 <20111130173327.069f46fb@skate>
 <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
Message-ID: <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeff,

On Wed, Nov 30, 2011 at 5:38 PM, Jeff Krasky <jeff.krasky@dspcg.com> wrote:
>> Those are not Buildroot variables, but Kbuild variables, that you must
>> pass when running the modules_install. The fact that EtherCAT contains
>> kernel modules makes it not completely straightforward to package.
>
> At what point is modules_install being run?
>
>> Do you need it right now ? I might be interested in helping package
>> EtherCAT, but I don't have much time at the moment.
>
> Time is very short, yes. ?Anything you can do to help is definitely
> appreciated. ?Like, for now, can you say more about running modules_install
> and passing parameters to it?
>

Since your ethercat is actually containing two things, being an
application *and* a kernel module, you should treat it as such. In my
opinion, you should either:

* create two different packages, one for ethercat and one for the
ethercat driver. Each would have a .mk file in a package/* directory.
* create one .mk file, but with two different sets of build rules, one
for the application and one for the driver. You can make sure that one
depends on the other so that they're always built together. If the
application is autotools-based, you can use the AUTOTOOLS
infrastructure. For the driver I suggest the GENTARGETS one (see
below).
* create one .mk file, with one set of build rules, that combine the
build steps for the application and for the kernel.

With regards to the kernel driver part, I have already given you an
example set of build rules in one of your other threads, see
http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/35273
Do you understand how these build rules work? Did you try them?

Building this with older versions of buildroot is perfectly possible,
if you have to stick with older versions for some reason. (if you are
free to update, I'd suggest you do). Do keep in mind that in previous
versions of buildroot, the LINUX_ prefix was called LINUX26_, so for
example LINUX_MAKE_FLAGS needs to be renamed to LINUX26_MAKE_FLAGS,
likewise with LINUX_DIR.

I hope this helps.

If you still have questions, I suggest you provide us with your
current.mk file and the problems (e.g. build errors) you still
experience with it. Please take some time to provide detailed
information, this will allow you to get more relevant responses from
the list.

Best regards,
Thomas
