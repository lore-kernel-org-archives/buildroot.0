From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Apr 2020 11:15:19 +0000
Subject: [Buildroot] [Bug 12801] Flag '-Wa,
 --noexecstack' is missing when building uclibc with newer binutils
In-Reply-To: <bug-12801-163@https.bugs.busybox.net/>
References: <bug-12801-163@https.bugs.busybox.net/>
Message-ID: <bug-12801-163-KyLP8XJXwa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12801

Marcel Patzlaff <m.patzlaff@pilz.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Product|buildroot                   |uClibc
          Component|Other                       |Other
           Assignee|unassigned at buildroot.uclibc |unassigned at uclibc.org
                   |.org                        |
                 CC|                            |uclibc-cvs at uclibc.org

--- Comment #3 from Marcel Patzlaff <m.patzlaff@pilz.de> ---
I finally found what the problem is. The check_as macro in uclibc/Rules.mak
does not function with newer binutils versions anymore. Executing the check
manually yield:

$ /opt/debug/buildroot_toolchain/usr/bin/arm-se-linux-uclibcgnueabihf-gcc
-Wa,--noexecstack -Wa,-Z -c -o /dev/null -xassembler /dev/null || echo "WTF"

Assembler messages:
Fatal error: The input '/dev/null' and output '/dev/null' files are the same


So basically, this seems to be uClibc bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
