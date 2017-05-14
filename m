From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 14 May 2017 19:45:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-11
In-Reply-To: <20170512062950.23CF0220A8@mail.free-electrons.com>
References: <20170512062950.23CF0220A8@mail.free-electrons.com>
Message-ID: <20170514174506.GA16283@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-05-12 08:29:50, Thomas Petazzoni wrote:

>        sparc |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/85062b5f9dbe74d7d1c6edfeda085268ecaef4c2 |

This one is puzzling. The configure steps ends with the following error:

```
Checking whether system has auto-close after fd-passing...
  ... test crashed, aborting.
  make: ***
  [/accts/mlweber1/instance-2/output/build/skalibs-2.4.0.2/.stamp_configured]
  Error 111
  make: Leaving directory `/accts/mlweber1/instance-2/buildroot'
```

The configure script tries to cross-compile and execute a program
(tryancilautoclose). The cross-compilation succeeds and of course the
execution fails, as it means running a program compiled for the
SPARC architecture on a x86 machine. Normally, the shell which executes
the program should return the code 126, as mentioned in the list of Bash
exit codes with special meaning [1].

Here the exit code is 111. When looking at tryancilautoclose.c, we can
see that 111 may be returned.

So this error means that either the shell managed to execute the
cross-compiled program or the shell does not follow the convention [1].

Which are the architecture of the build machine and the shell used?

[1] http://tldp.org/LDP/abs/html/exitcodes.html

--
ELB
