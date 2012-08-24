From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 11:34:18 +0200
Subject: [Buildroot] gdbserver with external crosstool
In-Reply-To: <CAJkQPOknYkU=jGjpS2B+b+DUYLNPq6NX-muxC04BBSKbbhGcLA@mail.gmail.com>
References: <CAJkQPOknYkU=jGjpS2B+b+DUYLNPq6NX-muxC04BBSKbbhGcLA@mail.gmail.com>
Message-ID: <20120824113418.18b14077@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Thu, 23 Aug 2012 09:45:35 +0100,
Aras Vaichas <aras.vaichas@gmail.com> a ?crit :

> I've got a question about building gdbserver when an external
> toolchain is selected.
> 
> in toolchain/gdb/Config.in:
> 
> config BR2_PACKAGE_GDB_SERVER
>         bool "Build gdb server for the Target"
>         depends on !BR2_TOOLCHAIN_EXTERNAL
>         help
>             Build the gdbserver stub to run on the target.
>             A full gdb is needed to debug the progam.
> 
> Why doesn't Buildroot build gdbserver when an external toolchain is selected?

Because for external toolchains, we assume that the gdbserver must be
provided by the external toolchain, together with the cross-gdb.

There are two reasons:

 1. Most pre-built external toolchains available out there provide both
    their own cross-gdb and gdbserver, so it makes sense to use them.

 2. Experience has shown that if there is a version difference between
    the cross-gdb and the gdbserver, there are often problems.
    Therefore, we really want people using external toolchains to use
    the provided gdbserver with their external toolchain rather than
    build their own.

> I noticed that both gdbserver and gdb are built (with the external
> toolchain) by Buildroot, but only gdb is copied over to the target.

I'm a bit confused: are you talking about the cross gdb or the target
gdb? When using an external toolchain, what we except people to do is:

 *) Use the cross-gdb provided pre-built by their external toolchain

 *) Use the BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY option so that the
 gdbserver provided pre-built by their external toolchain is copied to
 the target filesystem

 *) Optionally (but not really useful or recommended), they can enable
 the gdb package, which will build a full-blown gdb for the target,
 installed in the target filesystem. But that's a completely different
 thing than cross-gdb+gdbserver.

> I see that BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY allows the gdbserver
> from the external toolchain to be copied over.

Yes.

> So why doesn't Buildroot allow me to copy over the gdbserver that I
> built within Buildroot?

I'm confused again. Can you explain what you're doing exactly? In the
previous paragraph, you precisely said that there was an option to copy
gdbserver to the target filesystem, and now you're saying that there
isn't such an option. Are you talking about two different
configurations maybe?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
