From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 10:34:54 +0200
Subject: [Buildroot] target rootfs permissions
In-Reply-To: <20141024193436.GA29505@fox>
References: <20141024193436.GA29505@fox>
Message-ID: <20141025103454.0b923b26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 24 Oct 2014 16:34:36 -0300, Guido Mart?nez wrote:

> I've noticed that when building a rootfs, some of the permissions on the
> target depend on the users umask (directly and indirectly). This occurs
> because some files (notably the system skeleton and overlay) are copied
> with "rsync -a", which copies permissions exactly as they were on the
> source. The thing is, Git doesn't track file permissions (except for
> the exec bit) so both of these depend on the users umask at the time of
> cloning (if there were no posterior changes).
> 
> Also, some files are created in BR code with cp/mkdir, which depend on
> the current umask.
> 
> I think this is pretty important, since if we do care about permissions,
> the target rootfs may not be easily reproducible on other hosts.
> 
> For my current project, we do need a specific set of permissions and
> ownerships for each file in the rootfs. We're trying to isolate the
> custom application from the rest of the system, and give it the exact
> privileges it needs. I found that when I build the rootfs (my umask
> was 0027) the application could not do absolutely anything as / wasn't
> executable or readable by it. But building on other hosts (with more
> relaxed umasks) we had a working rootfs.
> 
> We accomplished this by adding a custom script that gets called just
> prior to the image creation, inside of the fakeroot script (thus, it
> gets called multiple times, but this isn't a big deal for us).
> 
> One downside of our approach is that in order to not depend on the
> previous set of permissions (which could vary), we need to specify the
> exact mode for each file. So we need to set the sticky bit on /tmp
> manually, make /etc/shadow not readable and etc, etc, etc.
> 
> Permissions alone could (maybe) be fixed by changing BR code to
> be aware of this issue, and by setting correct permissions on the
> overlay/skeleton via some script. But ownerships cannot be changed by
> a non-root user! And, since building as root is a Very Bad Thing (tm),
> we'd need to resort to fakeroot.
> 
> So: has anyone else had this problem?
> Is it important for someone else?
> What do you think a mainline solution would look like?

Thanks for your report. It is indeed a problem that should be fixed.
The only clean solution that I see is to have the fakeroot script reset
the permission for all files to a certain sane value (just like we
already have a 'chown -h -R 0:0' to re-assign all files to the root
user), and then re-adjust using makedevs the permissions of the needed
files, such as /tmp, /etc/shadow and so on.

Since /tmp, /etc/shadow and so on are part of the skeleton, one option
would be to make the skeleton a real package, so it could declare a
SKELETON_PERMISSIONS variable to adjust whatever is needed. This is
quite in line with some discussions we had recently about cleaning up
the skeleton from init scripts, and possibly making it a proper package.

I'm Cc'ing Maxime and Gustavo, who are both active on this topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
