From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 28 Apr 2019 00:47:37 +0200
Subject: [Buildroot] Avoid rebuilding host build tools
In-Reply-To: <CAD5jUk-8uJd7EOvFTdkrBdV3-xtu1CSOHVqn3-aGn7in1n+DBg@mail.gmail.com>
References: <CAD5jUk-8uJd7EOvFTdkrBdV3-xtu1CSOHVqn3-aGn7in1n+DBg@mail.gmail.com>
Message-ID: <a21e37f8-5822-e816-5b2f-d8f3e12e5918@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/04/2019 20:47, Radu Rendec wrote:
> Hi Everyone,
> 
> Is there any easy way to avoid rebuilding most of the host build tools,
> such as autoconf, automake, libtool, m4 and bison?

 I've been playing with that idea as well...


> All these tools are already installed on the host system from distro
> packages and are fairly new versions. Is there any good reason to
> rebuild them anyway (e.g. strict version dependencies)?

 Strict version dependencies are not a problem, because we can check the
version. Cfr. support/dependencies/check-host-tar.sh where we check both a
minimal and maximal version.

 The problem is rather that we don't *know* if there is some version dependency...

 That said, I think we can just go ahead and try it, and rely on the
autobuilders to tell us if something doesn't work, and update the minimum
version of that tool accordingly.

 Since we the oldest autobuilder we have is a CentOS6, I would use the versions
from that as the minimum as a start.

 Radu, do you feel up to adding this?

 Note that m4 etc. are used in many more places than e.g. cmake, so there are
many places where you have to replace host-m4 with BR2_M4_HOST_DEPENDENCY. So
this is not a small change.

 Regards,
 Arnout
