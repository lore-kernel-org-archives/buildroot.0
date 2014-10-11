From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Oct 2014 16:49:22 +0200
Subject: [Buildroot] [PATCH 0/3] Manage big root directory trees by
 breaking them up.
In-Reply-To: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
References: <1401341054-16705-1-git-send-email-vomlehn@canopus-us.com>
Message-ID: <54394372.30604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/05/14 07:24, vomlehn at canopus-us.com wrote:
> From: David VomLehn <vomlehn@canopus-us.com>

 Hi David,

 We've discussed this series at the Buildroot developer meeting, and we decided
to reject it. This is why:

> These patches are not as tightly coupled as the usually series of patches,
> but I think the pieces make more sense when viewed in the context of the
> whole patchset.  The problem to be solved is that Python is big and my root
> filesystem has to fit in a little flash device. So, I:
> 
> 1.	Created the ability to break the target filesystem into multiple
> 	filesystems,

 Although we do want to support the possibility to break down the target
filesystem into partitions, we don't want to add so many config options to do
it. Basically, we want to keep buildroot as simple as possible. So instead, we
want to provide the tools that are required to do this, like genpart, and then
allow the user to do it in a post-build and post-image script.


> 2.	Enhanced autotools so that I could specify the --prefix and
> 	--exec-prefix values. This allowed me to install packages in
> 	their own directory, which the above patch lets me split into a
> 	filesystem I can store on a much bigger flash device, and
> 3.	I modified the Python package so that the installation directory
> 	is a configurable.


 The problem with this is that it adds a user-visible feature that is only
useful for autotools packages. It is a bit similar to FOO_OVERRIDE_SRCDIR, but
for that one we can guarantee that it works for all packages. The CONF_PREFIX
only works for autotools packages and for python, we would need many many more
changes to have it for all possible packages.

 In addition, this is something that will break down easily, because it is not
tested. E.g. if a .mk file installs 10 files, and we forget to add the
CONF_PREFIX for one of them, that's easy to miss.

 Therefore we decided to reject these two patches as well.


 That said, thank you for your contribution and thank you for using buildroot!


 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
