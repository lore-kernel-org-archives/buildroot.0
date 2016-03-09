From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 12:23:22 +0100
Subject: [Buildroot] [PATCH 1/1] overlay: Allow overlay to be a tar
	archive.
In-Reply-To: <CABa6e=o7BoB-YYSfCs3Q8LnTHk_GUYxxjt50ztnsZM-HuaL+7Q@mail.gmail.com>
 (Cam Hutchison's message of "Wed, 9 Mar 2016 13:31:42 +1100")
References: <1453763906-22220-1-git-send-email-camh@xdna.net>
 <87pov44scp.fsf@dell.be.48ers.dk>
 <CABa6e=o7BoB-YYSfCs3Q8LnTHk_GUYxxjt50ztnsZM-HuaL+7Q@mail.gmail.com>
Message-ID: <87ziu728ut.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:

Hi,

 > On 9 March 2016 at 07:39, Peter Korsgaard <peter@korsgaard.com> wrote:

 >> Looking at the tar homepage, -a / --auto-compress was added in tar 1.20
 >> from early 2008, so this presumably breaks on older enterprise
 >> distributions like RHEL 5.

 > I did check when -a went in, but I figured 8 years ago was old enough.
 > I don't know much about the release dates of various distros or what
 > buildroot wants to support. Is there a guide as to what the cutoff should
 > be for host features?

We don't have anything fixed written down or set in stone, but I do know
that that we have users on RHEL 5.x, E.G. see these commits:

- 0bbd1dbc156cc81e6f9986c79774c67d537832a8
- cc7da4743e779d9792df0a91e1391112e88968b9
- 53223cbb4e775ce88c036ddbfcca260e23c5739e

I don't have access to a RHEL5 machine, so I cannot easily check the tar
version, but as it was released in ~2006, it presumably doesn't have tar
1.20 ;)


 >> Another potential issue that you assume that the tarball directly
 >> contains the rootfs overlay content (E.G. no subdirs). This is true for
 >> the Buildroot rootfs tarballs, but how common is this?

 > My use case is for using buildroot rootfs tarballs from other phases of
 > a larger build, both where some developers are responsible for some
 > parts (kernel/bootloader, common rootfs, specific applications,
 > integration), and where there are multiple boards to develop for that
 > have a large amount of commonality for which it is wasteful to rebuild
 > the same parts over and over.

Ok, and you use Buildroot as the toplevel (E.G. the thing that
integrates everything) buildsystem?

 > However, it strikes me now as I write this reply that the patch is wrong.
 > Any of the parts done under fakeroot that is captured in the tarball will
 > be lost when merged as an overlay tarball as the extraction is not done
 > under the fakeroot. I have no direct need for this but it was my intention
 > that this work - the rootfs in the tarball would be faithfully represented in
 > the enclosing rootfs.

Ahh yes.

 >> I'm not sure this is a common enough usecase to explicitly support
 >> versus just adding a simple post-image script.

 > Probably not. I've been carrying this patch or a variant for the last 6 years,

Wow, the rootfs-overlay stuff is afaik only from 2013 or so (before that
people did it manually in post-build scripts).

 > so I thought I'd submit the simplest version of it I have. But given the
 > questionable use case and that it is subtly wrong as noted above, I'd
 > suggest you just drop this patch.

Ok, I'll mark it as rejected in patchwork.

-- 
Venlig hilsen,
Peter Korsgaard 
