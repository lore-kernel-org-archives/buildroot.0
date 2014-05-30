From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Fri, 30 May 2014 23:29:55 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <8761kn7zw8.fsf@dell.be.48ers.dk>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>	<CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>	<5388A9DC.1010204@gmx.net>	<CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>	<20140530222718.5cb42dd5@free-electrons.com>	<5388ECDC.6050909@gmx.net>
 <8761kn7zw8.fsf@dell.be.48ers.dk>
Message-ID: <5388F853.1020406@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30.05.2014 22:52, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter K?mmel <syntheticpp@gmx.net> writes:
>
> Hi,
>
>   >> Agreed, and therefore I'd like to understand in more details why the
>   >> patch is needed. We typically don't commit things we don't understand
>   >> why they are needed :)
>
>   > In short: anybody assumes "#include <GLES2/gl2.h>" works when the search
>   > paths of pkg-config are used. But when pkg-config reports /usr/include/GLES2
>   > gl2.h could not be found, because there is no /usr/include/GLES2/GLES2/gl2.h.
>
>   > Until now this doesn't pop up because by chance the directory GLES2
>   > resides in /usr/include and this path is added by most by build systems.
>   > But the cmake configure scripts of Qt5 test for "GLES2/gl2.h" only in the path
>   > reported by pkg-config.
>
> But $SYSROOT/usr/include is the standard include path, so gcc
> automatically looks there. What exactly doesn't work for you?

See my last mail with the cmake code.

Overall I think it is the best solution that pkg-config reports
a path which in combination with the uppercase prefix in #include
makes it possible to include an OpenGL header without being dependent
on any implicit set include paths.

I don't know if Ubuntu is a reference here, but when you install gles2
     sudo apt-get install libgles2-mesa-dev
and have a look at the.pc file,
     cat /usr/lib/x86_64-linux-gnu/pkgconfig/glesv2.pc
(or gl.pc) you see, that there also the path to the dir containing GLES2 is set:

prefix=/usr
exec_prefix=${prefix}
libdir=${prefix}/lib/x86_64-linux-gnu
includedir=${prefix}/include

Name: glesv2
Description: Mesa OpenGL ES 2.0 library
Requires.private:
Version: 9.0.3
Libs: -L${libdir} -lGLESv2
Libs.private: -lm -lpthread -ldl
Cflags: -I${includedir}


>
> This is exactly the same as E.G. #include <sys/stat.h> for open(2).
>
