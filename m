From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 09:43:42 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <1776793705.15288726.1385627630446.JavaMail.root@openwide.fr>
References: <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <1776793705.15288726.1385627630446.JavaMail.root@openwide.fr>
Message-ID: <20131128094342.3f6c84e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

Please do not top post. This is considered bad practice on mailing
lists.

On Thu, 28 Nov 2013 09:33:50 +0100 (CET), Jeremy Rosen wrote:
> Just an overall comment, this patch serie is great, it will help us 
> a lot
> 
> by allowing us to clearly show to our customers what is specific 
> to their board and what is changes to the buildroot unfrastructure
> it will make it much easier for us to upstream all the non-specific 
> parts

Thanks for the feedback! Definitely great to see that this feature will
help companies upstream more things in Buildroot.

> on this particular one, if I remember correctly the kconfig infrastructure
> will not work correctly if one of the include is missing... so shouldn't
> your infrastructure check if $(BR2_EXTERNAL)/package/Config.in 
> exists, and create one if it doesn't ? 

The idea is that:

 * If the user is specifying a BR2_EXTERNAL location, then this
   location *must* contain a package/Config.in file. Even if it's empty.

 * If the user is not specifying a BR2_EXTERNAL location, then we are
   using support/dummy-external/ as a fake BR2_EXTERNAL, to ensure that
   package/Config.in exists.

There is no way to express in kconfig "include this file if it exists,
or ignore it if it doesn't". Yann and myself had written a patch for
kconfig that adds a new statement, similar to 'source' but that
silently ignores the inclusion if the given file doesn't exist. But
after implementing it, we found out that is was not necessary, as we
could simply use a fake BR2_EXTERNAL, and avoid changing kconfig
altogether.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
