From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 11:19:24 +0100
Subject: [Buildroot] host-libsemanage build failure
In-Reply-To: <20180118101016.GA11479@gmail.com>
References: <20180118070006.DE0B320994@mail.free-electrons.com>
 <20180118101016.GA11479@gmail.com>
Message-ID: <20180118111924.2a2bfdd9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Buildroot mailing list in Cc.

On Thu, 18 Jan 2018 11:10:16 +0100, Marcus Folkesson wrote:

> I'm looking at this build, but I'm unable to reproduce it.
> Has this been a problem for a while or is it new? Is it possible to see
> all build results for a certain package?

Yes:

  http://autobuild.buildroot.net/?reason=<package-version>

so:

  http://autobuild.buildroot.net/?reason=host-libsemanage-2.7

So it is the first time that this happens.

> However, I discovered another problem.
> libsemanage is installing configuration files to $(DESTDIR)/etc/, what
> is the best practice to handle these type of installations? I guess the
> SELinux guys do not want to have it installed to
> $(DESTDIR)$(PREFIX)/etc.
> This must have been a problem for a while, it does not seems to be
> related to my patch (same error even if I revert it).

Autotools typically has a separate sysconfdir option, which is not
subject to prefix:

                --prefix=/usr \
                --exec-prefix=/usr \
                --sysconfdir=/etc \

> Is it a big no-no to use DESTDIR=$(HOST_DIR) in the installation stage?
> I know you told me to omit DESTDIR and instead use PREFIX=$(HOST_DIR)
> during host installation.

What is the problem with using the standard semantic?
DESTDIR=$(HOST_DIR) PREFIX=$(HOST_DIR) is not correct because files
would be installed in $(HOST_DIR)/$(HOST_DIR). Just DESTDIR=$(HOST_DIR)
PREFIX=/usr is not correct, because that means the program/library
expects to be executed from /usr.

> When talking about SELinux.. I saw that we have more packages that is
> part of the SELinux project that I should fix:
> - semodule-utils
> - restorecond
> - checkpolicy
> - policycoreutils

Right. Though perhaps we should wait for upstream's feedback. I'm a bit
unsure of what will be upstream's reaction to those patches, so perhaps
wait for feedback before fixing all the remaining packages ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
