From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Aug 2019 23:05:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/autofs: fix mount,
 umount and fsck program paths
In-Reply-To: <20190817144757.73c49bb3@windsurf.home>
References: <20190816090913.16141-1-fontaine.fabrice@gmail.com>
 <20190817144757.73c49bb3@windsurf.home>
Message-ID: <9a265eda-f540-b25d-f22d-a3dd5ebc691c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 14:47, Thomas Petazzoni wrote:
> Hello Fabrice,
> 
> On Fri, 16 Aug 2019 11:09:13 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Fixes:
>>  - https://bugs.buildroot.org/show_bug.cgi?id=11876
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> ---
>>  package/autofs/autofs.mk | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> Applied to master, thanks. However, autofs now has the path to those
> programs, but they may not necessarily be installed on the target.
> autofs has no dependency on Busybox, or any other package that would
> provide mount, umount, mount.nfs, fsck.*, etc. Perhaps this is
> something that should be investigated? Does autofs need those tools in
> all situations?

 mount and umount and modprobe really have to be there or the system is broken.
We don't check for such insanity. In fact, we assume that everything needed for
a "normal" system (where "normal" is not exactly specified) is provided by
either busybox or something else.

 fsck.ext* I covered in my reply to the original patch.

 mount.nfs I'm not sure of. It is only used to check the version of mount.nfs,
which is only used under the following comment:

         * Check for either a list containing only proximity local hosts
         * or a single host entry whose proximity isn't local. If so
         * return immediately as we don't want to add probe latency for
         * the common case of a single filesystem mount request.
         *
         * But, if the kernel understands text nfs mount options then
         * mount.nfs most likely bypasses its probing and lets the kernel
         * do all the work. This can lead to long timeouts for hosts that
         * are not available so check the kernel version and mount.nfs
         * version and probe singleton mounts if the kernel version is
         * greater than 2.6.22 and mount.nfs version is greater than 1.1.1.
         * But also allow the MOUNT_WAIT configuration parameter to override
         * the probing.


 I don't really understand what is said here... But apparently, the worst case
is that it's a bit slower in some specific corner case.

 Regards,
 Arnout


> 
> Best regards,
> 
> Thomas
> 
