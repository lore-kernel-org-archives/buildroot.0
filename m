From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Dec 2019 16:13:51 +0100
Subject: [Buildroot] Potential lurking issue with host rpaths
Message-ID: <20191225151351.GO26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, Peter, All,

Consider the following situation for packages 'bar' and 'libfoo':
  - upstream bar has an optional dependency on libfoo
  - in Buildroot, host-bar does not depend on host-libfoo, because
    we do not need that dependency [0]
  - a third package (whatever, not in the dependency chain of host-bar)
    brings in host-libfoo into the build.

Now, let's look at what happens:

- without PPD
  - libfoo not installed on the host system
    - host-libfoo built before host-bar
      - bar links to libfoo
        - bar has an RPATH for another lib
          => OK
        - bar does not have an RPATH for another lib
          -> check-host-rpath errors out for host-bar
          => OK
    - host-libfoo built after host-bar
      -> bar not linked to libfoo
      => OK

  - libfoo installed on the host system
    - host-libfoo built before host-bar
      - bar links to host-libfoo
        - bar has an RPATH for another lib
          => OK
        - bar does not have an RPATH for another lib
          -> check-host-rpath errors out for host-bar
          => OK
    - host-libfoo built after host-bar
      - bar links to system libfoo
        - bar has an RPATH for another lib
          -> check-host-rpath OK for both host-bar and host-libfoo
          -> error at runtime: bar uses host-libfoo instead of system
             libfoo
          => KO, MISSED
        - bar does not have an RPATH for another lib
          -> check-host-rpath errors out for host-libfoo
          => OK [1]


- with PPD
  - libfoo not installed on the host system
    -> bar never linked to libfoo
    => OK

  - libfoo installed on the host system
    -> bar always linked to system libfoo
      - bar has an RPATH for another lib
        -> check-host-rpath OK for host-bar
        -> error at runtime: bar uses host-libfoo instead of system
           libfoo, *but* only once the final, complete host directory
           has been aggregated
        => KO, MISSED
      - bar does not have an RPATH for another lib
        -> check-host-rpath OK for host-bar
        => OK


So, in either case (PPD or no PPD), we do have an issue with optional
dependencies for host packages...


Now, the questions:
  - are those two issues for real, or did I miss something?
  - is they are real, how can we fix them?


[0] for example host-systemd does not depend on host-libselinux, because
    we only need systemctl, but systemd will always also build nspawn,
    which may link with libselinux if present.

[1] check-host-rpath errors out for host-libfoo instead of host-bar, so
    for the wrong package, but at least it errors out and we can notice
    the issue.


Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
