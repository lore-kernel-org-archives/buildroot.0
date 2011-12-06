From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 06 Dec 2011 15:18:02 -0300
Subject: [Buildroot] [PATCH] netsnmp: bump to 5.7.1 LTS
In-Reply-To: <87liqpr2qx.fsf@macbook.be.48ers.dk>
References: <1323164603-5503-1-git-send-email-luca@lucaceresoli.net>
 <ef682c5dfbfcc25c3eaec14233e080a5@zacarias.com.ar>
 <4EDDF849.7020607@comelit.it>
 <dc31ce84ed5d15142ad8641869a5bedb@zacarias.com.ar>
 <87liqpr2qx.fsf@macbook.be.48ers.dk>
Message-ID: <b999e4c6f3d2325cef6ec1aa713c45ad@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.12.2011 15:09, Peter Korsgaard wrote:

> Thanks, but I don't think that's the culprint as closedir() in uClibc
> checks for NULL pointers (and have done so for 10 years).
>
> int closedir(DIR * dir)
> {
>         int fd;
>
>         if (!dir) {
>                 __set_errno(EBADF);
>                 return -1;
>         }
>
>         ..
> }

Simple testcase for my failure:
Run snmpd with a basic config and run a snmpwalk against localhost 
"snmpwalk -v 1 -c something localhost".
The snmpd daemon will die before the walk is done.
Rebuilding net-snmp with the patch fixes it.
And a gdb backtrace points at closedir() exactly.
Powerpc e300c3 target with latest gcc/binutils and uclibc 0.9.32.
Regards.
