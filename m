From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Dec 2019 22:34:30 +0000
Subject: [Buildroot] [Bug 12196] duma package
In-Reply-To: <bug-12196-163@https.bugs.busybox.net/>
References: <bug-12196-163@https.bugs.busybox.net/>
Message-ID: <bug-12196-163-IVQVj8jzR3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12196

--- Comment #6 from Arnout Vandecappelle <arnout@mind.be> ---
Really weird... This is the disassembly around the faulting instruction:

   0xb6e04694 <+672>:   b       0xb6e046dc <__gettextparse+744>
   0xb6e04698 <+676>:   b       0xb6e046dc <__gettextparse+744>
=> 0xb6e0469c <+680>:   b       0xb6e04ab8 <__gettextparse+1732>
   0xb6e046a0 <+684>:   b       0xb6e04a94 <__gettextparse+1696>
   0xb6e046a4 <+688>:   b       0xb6e049fc <__gettextparse+1544>
   0xb6e046a8 <+692>:   b       0xb6e049e4 <__gettextparse+1520>


So it's in the middle of a switch table, simple relative branch instruction
0xea000105. The instructions that it jumps to all look pretty normal as well.

However, duma does do weird things with the code. It is possible that the real
fault is hidden by some exception handling within duma itself... gdb isn't able
to print a proper backtrace, so that could be an indication...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
