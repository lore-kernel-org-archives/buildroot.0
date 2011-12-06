From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 20:00:19 +0100
Subject: [Buildroot] [PATCH] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <b999e4c6f3d2325cef6ec1aa713c45ad@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 06 Dec 2011 15:18:02 -0300")
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
 <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar>
 <4EDDF849.7020607@comelit.it>
 <dc31ce84ed5d15142ad8641869a5bedb@zacarias.com.ar>
 <87liqpr2qx.fsf@macbook.be.48ers.dk>
 <b999e4c6f3d2325cef6ec1aa713c45ad@zacarias.com.ar>
Message-ID: <87hb1dr0e4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Simple testcase for my failure:
 Gustavo> Run snmpd with a basic config and run a snmpwalk against localhost
 Gustavo> "snmpwalk -v 1 -c something localhost".
 Gustavo> The snmpd daemon will die before the walk is done.
 Gustavo> Rebuilding net-snmp with the patch fixes it.
 Gustavo> And a gdb backtrace points at closedir() exactly.
 Gustavo> Powerpc e300c3 target with latest gcc/binutils and uclibc 0.9.32.

Sorry, I missed the fact that include/dirent.h annotates closedir() with
__attribute__((nonnull)), which probably makes GCC drop the redundant if
(!dir) check.

I don't see any specific requirement in susv3 that it should handle NULL
pointers, so the patch seems OK:

http://www.bcs.zp.ua/manuals/en/susv3/functions/closedir.html

-- 
Bye, Peter Korsgaard
