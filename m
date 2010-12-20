From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 20 Dec 2010 16:04:09 +0000
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <20101220150504.4dcf2e18@surf>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<20101217113436.43ec2958@surf>
	<1292591501.6496.58.camel@dubciaranr0.verifone.com>
	<20101220150504.4dcf2e18@surf>
Message-ID: <1292861049.2560.17.camel@dubciaranr0.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

Ar Luan, 2010-12-20 ag 15:05 +0100, scr?obh Thomas Petazzoni:

> Sorry, I didn't follow you here. Could you elaborate ?

Lets say that you've cloned a GIT repository for PKG_X a few weeks ago
and done a build, now you get a new configuration (probably by changing
"local.mk" in my understanding of your scheme) and the version string
for PKG_X now contains a value that is not present in the local clone.
So, you type "make" and Buildroot tries to check out the specified new
version, which will fail since the reference is unknown.  At this stage,
I propose that Buildroot should attempt to get an update from upstream
(git fetch origin) and then attempt to check out the version again,
failing if this isn't possible.  It just makes things easier when
there's distributed development going on that an individual wouldn't
have to manually update every repository that is used (in my current
project I have in excess of 40 and this will probably reach 100 before
the project is complete).
A similar principle applies more directly for SVN repository versions,
since version checkouts are on-line.

> "make clean" just deletes
> > BUILD_DIR, not the OVERRIDE dirs.
> 
> Yes, that's the plan.

Once possible problem I envisage with this is that the built objects in
these overridden directories will stick around.  This may lead to
problems.  I suppose the clean/distclean/mrproper target for these could
be called but it's hardly the most reliable approach.  You may have a
cleaner solution in mind.

> What I meant here is that components that are fetched from tarballs are
> not being handled by Sonic's approach.

Aha, I think you mean that the OVERRIDE_DIR applies regardless of where
the package comes from.  Right?

> The approach I propose also shouldn't require any modification to the
> package makefiles. It should only require modifications at the package
> infrastructure level.

Excellent!
