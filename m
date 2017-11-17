From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 10:55:50 +0100
Subject: [Buildroot] [PATCH] systemd: set time epoch for reproducible
 builds
In-Reply-To: <20171116170316.19081-1-john@metanate.com>
References: <20171116170316.19081-1-john@metanate.com>
Message-ID: <20171117105550.0c95e622@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 17:03:16 +0000, John Keeping wrote:
> Systemd embeds a timestamp which is used to impose a minimum bound on
> the system time during boot.  Normally this comes from stat'ing the NEWS
> file included with the systemd source, but this makes the build
> non-reproducible.  Pass in $SOURCE_DATE_EPOCH to use a deterministic
> timestamp when reproducible builds are enabled.
> 
> Signed-off-by: John Keeping <john@metanate.com>

Hum, systemd uses 'stat -c %Y NEWS', which returns:

       %Y     time of last data modification, seconds since Epoch

I just extracted the systemd tarball with Buildroot, and:

output/build/systemd-234 (master)$ stat NEWS 
  File: NEWS
  Size: 378872    	Blocks: 744        IO Block: 4096   regular file
Device: 10302h/66306d	Inode: 34473900    Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/  thomas)   Gid: ( 1000/  thomas)
Access: 2017-11-17 10:51:07.369562977 +0100
Modify: 2017-07-12 16:01:10.000000000 +0200
Change: 2017-11-17 10:51:07.510563710 +0100
 Birth: -

So the modification date is July 12th, and not today. So for a given
systemd release, the output of "stat -c %Y NEWS" is therefore stable,
and will not change.

Look:

$ stat -c %Y NEWS 
1499868070

$ date -d @1499868070 +%Y-%m-%d 
2017-07-12

So I'm not sure why your patch would be necessary. Could you check
what's going on?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
