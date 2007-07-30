From: Michael Hunold <hunold@linuxtv.org>
Date: Mon, 30 Jul 2007 10:40:42 +0200
Subject: [Buildroot] Why is --disable-gdbmi specified for host GDB build?
Message-ID: <46ADA40A.3000508@linuxtv.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I can happily remote debug my MIPS target using the host GDB 6.3 build
by buildroot and using "ddd" as a GUI.

Now I tried to use Visual Slickedit, but this fails. It turns out that
Slickedit provides the "-interpreter=mi" argument to the host GDB, which
gives: "Interpreter `mi' unrecognized"

After some searching it turns out that MI support is disabled via
--disable-gdbmi in toolchain/gdb/gdb.mk.

Quote:
------------------------------schnipp------------------------------
# NOTE: This option should not be used with gdb versions 6.4 and above.
ifeq ($(GDB_VERSION),6.2.1)
DISABLE_GDBMI:=--disable-gdbmi
endif

ifeq ($(GDB_VERSION),6.3)
DISABLE_GDBMI:=--disable-gdbmi
endif
endif
------------------------------schnipp------------------------------

Then I found this bug report:
http://busybox.net/bugs/view.php?id=602

"vapier" correctly states that "disabling gdmi ignores the issue
(whatever that may be)".

For my specific toolchain build, I simply removed the above lines and
the compilation works fine. Now I have a host GDB 6.3 that includes the
MI interpreter and works with Slickedit.

Can anyone tell me what the original problem was so that --disable-gdbmi
was added?

Best regards
Michael Hunold.
