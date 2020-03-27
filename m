From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 07:45:41 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-generic.mk: create folders
 before calling hooks
In-Reply-To: <20200312091530.287681-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 12 Mar 2020 10:15:29 +0100")
References: <20200312091530.287681-1-thomas.petazzoni@bootlin.com>
Message-ID: <87wo76fg8a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 0e2be4db8ab01d479177a3a187c22525752195ae
 > ("package/pkg-generic: make file list logic parallel build
 > compatible"), the logic to create the list of files installed by a
 > particular package was significantly reworked to be compatible with
 > top-level parallel build.

 > Before this commit, there was only a after-install step of listing the
 > files in HOST_DIR/TARGET_DIR/STAGING_DIR. But after this commit, we
 > now have a before-install logic and an after-install logic.

 > It turns out that when the before-install logic is called for the very
 > first host package, $(HOST_DIR) doesn't exist yet, and therefore the
 > cd $(2) fails, with an error message:

 > /bin/sh: line 0: cd: /home/thomas/buildroot/output/host: No such file or directory

 > In fact, $(HOST_DIR), $(STAGING_DIR), $(TARGET_DIR) and
 > $(BINARIES_DIR) are created by the make rules for host installation,
 > staging installation, target installation and images installation, but
 > *after* calling the step_start hooks.

 > So, we simply fix this problem by creating the directories *before*
 > calling the step_start hooks.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > This is different solution than the one initially proposed at
 > http://patchwork.ozlabs.org/patch/1252046/, following some discussion
 > with Yann E. Morin on IRC. Since the creation of the directories is
 > already done somewhere, it makes sense to rely on that rather than
 > adding more code to create them in a difference place.

 > This patch needs to be backported to 2020.02.x.

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
