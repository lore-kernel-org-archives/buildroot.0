From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 17:15:51 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
	file.
In-Reply-To: <20170715114432.0b01a373@windsurf> (Thomas Petazzoni's message of
 "Sat, 15 Jul 2017 11:44:32 +0200")
References: <20170713142549.28078-1-aduskett@gmail.com>
 <20170715114432.0b01a373@windsurf>
Message-ID: <87d191afyw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 13 Jul 2017 10:25:48 -0400, Adam Duskett wrote:
 >> currently there are a few packages in buildroot that are set to not
 >> be selectable unless the user wishes to use glibc specifically because
 >> the package uses fts.h.
 >> 
 >> uClibc actually does have a fts implimentation, and it's selectable in
 >> uclib-menuconfig.  However; this has two issues with it:
 >> 
 >> 1) Most users wouldn't know that there is even a uClibc-menuconfig
 >> 2) Even if the user does select fts support in uClibc-menuconfig, the
 >> packages that would now compile and work would still not be selectable
 >> because they explicitly require BR2_TOOLCHAIN_USES_GLIBC.
 >> 
 >> Enabling fts support increases the size of uclibc by 75~kb according to
 >> the menuconfig option.  This is a acceptable size increase to fix the
 >> few packages that require fts.h support.
 >> 
 >> Signed-off-by: Adam Duskett <aduskett@gmail.com>

 > Peter, what is your thought on enabling FTS by default in our uClibc-ng
 > configuration ?

 > Note that contrary to what Adam commit log says, the size increase is
 > 7.5 KB.

Hmm, 7.5KB isn't much - But fts isn't enabled by default in uClibc-nc,
it is a legacy BSD feature and it also isn't supported by musl.

It is easy to enable uClibc options, but difficult to disable them again
later (as users of the affected packages get caught).

Looking around, it seems we are only talking about 3 packages (if the
annotations are correct):

git grep -l 'fts.h' **/Config.in
package/libcgroup/Config.in
package/libselinux/Config.in
package/libsemanage/Config.in

Do we care enough for selinux users on uClibc (libcgroup seems to only
be an optional dependency for gst1-rtsp-server) to let all other
uClibc-ng users pay?

-- 
Bye, Peter Korsgaard
