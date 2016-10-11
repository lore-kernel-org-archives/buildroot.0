From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 12:22:47 +0200
Subject: [Buildroot] [PATCH] polarssl: deprecate on security grounds
In-Reply-To: <1476120393-19918-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476120393-19918-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161011122247.2dea9911@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Oct 2016 14:26:33 -0300, Gustavo Zacarias wrote:
> The 1.2.x branch is no longer maintained and the latest release from the
> maintained branches (2.3, 2.1, 1.3) were security releases, so more
> likely than not 1.2 is affected.
> In consequence switch shairport-sync to the openssl backend.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

I'm fine with the principle, but..

>  Config.in.legacy                         | 10 ++++++++++

... with your change, we get two definitions of the
BR2_PACKAGE_POLARSSL variable. The addition to Config.in.legacy should
only take place when the package gets removed. Deprecated packages are
meant to still allow the build to take place. But with the
Config.in.legacy option having the same name, you can't build, because
you're selecting BR2_LEGACY, which prevents the build from starting.

In fact, amusingly, with our process, "deprecating" a package means
that it blindly disappears for users.

But if you remove the package, we are warning the user by aborting the
build, thanks to the Config.in.legacy mechanism.

So I'm wondering if we shouldn't simply drop the polarssl package
altogether, in order to take advantage from the Config.in.legacy
mechanism.

Yann, Peter, Arnout, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
