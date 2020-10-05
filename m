From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Oct 2020 13:14:22 +0000
Subject: [Buildroot] [Bug 13236] Can't compile linux 5.4.8 (with gcc 10 on
 host)
In-Reply-To: <bug-13236-163@https.bugs.busybox.net/>
References: <bug-13236-163@https.bugs.busybox.net/>
Message-ID: <bug-13236-163-Si1YSaLaR9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13236

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
This is indeed a Linux kernel bug and not really something we can do about
(unless this is one of out defconfigs?) as you can specify a custom Linux
kernel version.

The issue has been fixed in the upstream 5.4.x kernel since commit
35b34d264cb3479 (5.4.29):

commit 35b34d264cb347909ec89d9fa895900035d5438c
Author: Dirk Mueller <dmueller@suse.com>
Date:   Tue Jan 14 18:53:41 2020 +0100

    scripts/dtc: Remove redundant YYLOC global declaration

    commit e33a814e772cdc36436c8c188d8c42d019fda639 upstream.

    gcc 10 will default to -fno-common, which causes this error at link
    time:

      (.text+0x0): multiple definition of `yylloc'; dtc-lexer.lex.o (symbol
from plugin):(.text+0x0): first defined here

    This is because both dtc-lexer as well as dtc-parser define the same
    global symbol yyloc. Before with -fcommon those were merged into one
    defintion. The proper solution would be to to mark this as "extern",
    however that leads to:

      dtc-lexer.l:26:16: error: redundant redeclaration of 'yylloc'
[-Werror=redundant-decls]
       26 | extern YYLTYPE yylloc;
          |                ^~~~~~
    In file included from dtc-lexer.l:24:
    dtc-parser.tab.h:127:16: note: previous declaration of 'yylloc' was here
      127 | extern YYLTYPE yylloc;
          |                ^~~~~~
    cc1: all warnings being treated as errors

    which means the declaration is completely redundant and can just be
    dropped.

    Signed-off-by: Dirk Mueller <dmueller@suse.com>
    Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
    [robh: cherry-pick from upstream]
    Cc: stable at vger.kernel.org
    Signed-off-by: Rob Herring <robh@kernel.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
