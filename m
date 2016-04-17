From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 17 Apr 2016 16:34:26 +0200
Subject: [Buildroot] host=win32
In-Reply-To: <CAFjNrKLdChKO10W3LLYWKxhW85CyNRXRN7M=qigxf6h=mDAPbw@mail.gmail.com>
References: <CAFjNrKLdChKO10W3LLYWKxhW85CyNRXRN7M=qigxf6h=mDAPbw@mail.gmail.com>
Message-ID: <57139EF2.6050108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Daniel,

On 04/16/16 23:11, Daniel Franzini wrote:
> Hello all.
>
> I'm new to buildroot but a reasonably seasoned software developer. Now I'm
> having some issues with old toolchains (uclibc-targetted) for custom boards
> developed by a partner of mine.
>
> Using buildroot, in a almost out-of-the-box setup (arm-linux-uclibc) I can
> actually create a shiny new toolchain for these board and that is pretty much fine.
>
> The thing is that most of our developers use Windows based workstations. So I
> have done some research on tools that could be used to generate a Windows
> hostable toolchain and here I am.

  To start with: there is very little interest in the Buildroot community to 
maintain such a feature. I'm not even sure if it is possible to build a Linux 
kernel on Windows.

  But as far as I understand, you're actually only interested in the toolchain 
itself, not building packages and a rootfs?


> From what I could understand from the manuals,
> it is possible to use a external toolchain to build the desired toolchain in
> buildroot. So here are the questions:
>
> 1.) Can this external toolchain be mingw-baed? There are pre-packaged mingw tool
> for several mainstream linux distros (Debian, Ubuntu) and I tought they could be
> with buildroot. There are also some software that is cross-compiled from Linux
> to Win32 (FileZila).

  The mingw toolchain on Debian allows you to cross-build Windows binaries on 
your Debian system. So if your goal is to use buildroot to build for a board 
that is running Windows, yes, then this would be an option. Well, except that it 
wouldn't work, of course :-) But I guess this is anyway not what you want.

  What you want is to use the mingw toolchain as your "host" toolchain, so that 
the cross-compiler that is created will run on Windows. This can be done by 
passing HOSTCC=<path-to-mingw> and same for HOSTCXX and HOSTCPP. Except that 
this also doesn't work, because buildroot will try to actually run these 
binaries (e.g. to compile the standard C library).

>
> 2.) Is there any serious limitation with the mingw tools that prevent them from
> building gcc inside Linux? I mean, if they can build some software, they can
> build gcc also. What is, if any, the problem with mingw tools?

  The problem is that a toolchain is not just a compiler. A toolchain also has a 
standard C library, a standard C++ library, binutils (linker, assembler, ...), 
and all of that has to be installed in a sysroot so the cross-compiler can find 
the correct headers and binaries when building the software. Creating such a 
cross-compiler that runs on a different platform than the one you're building on 
is called a Canadian cross-compiler. Buildroot doesn't support that. 
Crosstool-NG has limited support for it, but it is extremely fragile.

  You're much better of teaching your team to us buildroot in a VM. We now ship 
a vagrantfile that should make it trivial to set up such a VM [1]. On current 
hardware with virtualization extension, the overhead of running in a VM seems to 
be acceptable. You can add some scripts on the Windows side to automate ssh-ing 
into the VM and starting a build.

  That said, I personally believe that it's better if your Windows-based 
developers just develop the application code natively in Windows, and offload 
the target builds to either CI infra or ssh into a dedicated (Linux) build 
server. A decent headless build machine costs less than 300 euros nowadays, and 
it just makes life a lot easier.

  Regards,
  Arnout


[1] https://buildroot.org/downloads/manual/manual.html#getting-buildroot

>
> 3.) I'm willing to give this a try but I still have to figure out things in
> buildroot. Does anyone has a good starting point?
>
>
> Thanks in advance.
>
> --
> Daniel
>
> "Let us change our traditional attitude to the construction of programs. Instead
> of imagining that our main task is to instruct a computer what to do, let us
> concentrate rather on explaining to human beings what we want a computer to do."
> (Donald Knuth)
>
> "Yes, technogeeks can be funny, even if only to each other."
> (http://www.boogieonline.com/revolution/science/humor/)"
>
> "Man is driven to create; I know I really love to create things. And while I'm
> not good at painting, drawing, or music, I can write software." (Yukihiro
> Matsumoto, a.k.a. ``Matz'')
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
