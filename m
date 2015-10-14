From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 12:38:19 +0000 (UTC)
Subject: [Buildroot] [Bug 8271] Buildroot wit x86_64 architecture fails to
 boot on qemu with kernels >=3.10
In-Reply-To: <bug-8271-163@https.bugs.busybox.net/>
References: <bug-8271-163@https.bugs.busybox.net/>
Message-ID: <20151014123819.0F9A281D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8271

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-14 12:38:18 UTC ---
Did you specify explicitly a CPU model to be emulated by Qemu using the -cpu
option? If you don't, my understanding is that it will emulate a CPU similar to
the host CPU (but I'm not sure about this). In any case, if your Qemu was
emulating something that didn't support the movbe instruction, then it would
break exactly like it did for you. Can you please check your Qemu setup ?

Also, old versions of Qemu were not properly emulating the n270 (which is the
Qemu speak for Atom), and were precisely not emulating the movbe instruction:
https://lists.gnu.org/archive/html/qemu-devel/2013-02/msg01201.html.

So my bet is really an emulation issue on your side. I've looked at the kernel,
and the ARCH_USE_BUILTIN_BSWAP option has not been removed since commit
83a57a4de1a222c351667ef9a0fedaac1295e85b, so I believe that this kernel commit
has since then been widely tested, and that it is correct.

I'll mark the bug as "works for me". Please do not hesitate to re-open with
more details about your Qemu setup (version, and which -cpu option you've used)
if you can still reproduce the problem. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
