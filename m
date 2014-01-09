From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2014 20:14:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-01-08
In-Reply-To: <20140109073009.A1897100CCB@stock.ovh.net>
References: <20140109073009.A1897100CCB@stock.ovh.net>
Message-ID: <20140109191427.GB3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-01-09 08:30 +0100, Thomas Petazzoni spake thusly:
[--SNIP--]
> Detail of failures
[--SNIP--]
>        arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/40a5dde3b553e98c05a7f52d1c1ff7a230686c8b/
>     x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/eb94659357e0dc68efd45aaa9e9fa03ee286f533/

OK, so I've digged a bit into that ola build failure.

What happens is that ola runs the host-python to check if it can
'import' the google.protobuf module.

Of course, this fails since google.protobuf is installed in target/ and
not in host/ (and we do not explicitly install a host-variant).

So, this test is inherently flawed for cross-compilation.

There is a very simple trick^Whack we can use to fix this issue, either:
  - remove the test entirely, since we enforce the dependency from the
    Config.in an ola.mk, and thus we know google.protobuf will be
    present
  - install a host-google-protobuf as well, so our host Python finds it.

I've tested the first solution, and it builds fine. Not runtime-tested,
since I don't have any OLP hardware.

I'll shortly send a patch with this first solution. If any interested in
this package could test and report sucess/failure, that be great! TIA! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
