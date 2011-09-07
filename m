From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Sep 2011 18:22:51 +0200
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <4E673792.5040001@free-electrons.com>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <201109061803.05970.arnout@mind.be> <4E673792.5040001@free-electrons.com>
Message-ID: <201109071822.51608.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 07 September 2011 11:21:22, Maxime Ripard wrote:
> On 06/09/2011 18:03, Arnout Vandecappelle wrote:
> > On Monday 05 September 2011 18:15:14, Maxime Ripard wrote:
> >> On 05/09/2011 08:52, Thomas Petazzoni wrote:
> >>> Yes, exactly. However, I don't really like the name <pkg>_DEVICE_TABLE
> >>> because, it might be for other purposes as well (setting setuid bit,
> >>> giving specific owner/group or permissions, etc.). Does anyone has an
> >>> idea for a better name?
> >> 
> >> I agree, I don't like it neither, but I have no idea on what could be
> >> better...
> >> 
> >> Files, maybe, but I find it way too generic.
> >
> > 
> >  How about _FILE_MOD_TABLE (cfr. chmod)?
> 
> Hmm, I'm not quite sure, it is more than just mod. Maybe reuse the
> "skeleton" term already in use in buildroot.

 AFAICS it does three things:
- make device nodes (mknod)
- change permissions (chmod)
- set ownership (chown)


 So skeleton is not really the right term, as it only refers to the mknod 
function again.  (Although not-yet-existing files and directories are created, 
that's not usually the main purpose for files and directories.)

 FILE is also not a good idea since it also applies to directories and device 
nodes which are not really files.

 A complete name would be _NOD_MOD_OWN_TABLE, but that's too long and too 
cryptic :-)  Plus, we might want to add things like setting the utimes etc. in 
the future.

 The functionality is in fact comparable to install - copy files and set 
attributes (except for the copy part).  So we could use _ATTRIBUTE_TABLE. 
Unfortunately, 'attributes' could also refer to the e2fs file attributes, 
which are a different thing entirely (cfr. man chattr).  Or 
_FILE_INSTALL_TABLE.

 We could also consider that it sets most of the content of struct stat.  But 
_STAT_TABLE is again a bit cryptic.


 Enough possibilities...


 Regards,
 Arnout
 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
