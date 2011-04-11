From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 11 Apr 2011 09:58:13 +0200
Subject: [Buildroot] Starting programs in the background at init time: stdin
	EOF problem
Message-ID: <BANLkTi=Vx9c7OJ0arjwmrr6=WcTYFUfpyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need to start a set of programs when the board boots. I'm using
scripts in /etc/init.d/ to accomplish this.
Since I shouldn't block the other inits, I put these programs in the
background. But, this seems to give problems for programs that read
from stdin: read immediately returns with EOF (return value 0).

For example, the following script:
/etc/init.d/S50shell
#!/bin/sh
/path/to/shell &

with the following 'shell' program:
#include <stdio.h>
#include <unistd.h>
int main (void)
{
    int len;
    char in[1];
    while (1) {
        printf("\n--> ");
        len = read(0, in, 1);
        write(1, in, len);
    }
}

results in a continuous stream of "-->" to be printed at init time.
The read is supposed to be blocking, but returns prematurely because
end-of-file is detected on stdin.

If I do not put /path/to/shell in the background, the program works as expected.

What is the recommended way to start programs in such an embedded
environment? Besides this background problem, I also noticed problems
with using Ctrl-C depending on whether you start the program with a
init.d script (on /dev/console) or explicitly put it on a serial tty
in inittab.
Eventually, I would like to start a bunch of programs in the
background, and then present a login prompt to the user on the serial
tty.

Thanks,
Thomas
