From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 08 Sep 2011 11:00:26 +0100
Subject: [Buildroot] [PATCH 1/2] Add support for package-declared devices
In-Reply-To: <4E687A46.1000705@free-electrons.com>
References: <cover.1314965303.git.maxime.ripard@free-electrons.com>
 <201109061803.05970.arnout@mind.be> <4E673792.5040001@free-electrons.com>
 <201109071822.51608.arnout@mind.be> <4E687A46.1000705@free-electrons.com>
Message-ID: <1315476029.19139.4.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar D?ar, 2011-09-08 ag 10:18 +0200, scr?obh Maxime Ripard:
> On 07/09/2011 18:22, Arnout Vandecappelle wrote:
> > 
> > On Wednesday 07 September 2011 11:21:22, Maxime Ripard wrote:
> >> On 06/09/2011 18:03, Arnout Vandecappelle wrote:
> >>> On Monday 05 September 2011 18:15:14, Maxime Ripard wrote:
> >>>> On 05/09/2011 08:52, Thomas Petazzoni wrote:
> >>>>> Yes, exactly. However, I don't really like the name <pkg>_DEVICE_TABLE
> >>>>> because, it might be for other purposes as well (setting setuid bit,
> >>>>> giving specific owner/group or permissions, etc.). Does anyone has an
> >>>>> idea for a better name?
> >>>>
> >>>> I agree, I don't like it neither, but I have no idea on what could be
> >>>> better...
> >>>>
> >>>> Files, maybe, but I find it way too generic.
> >>>
> >>>
> >>>  How about _FILE_MOD_TABLE (cfr. chmod)?
> >>
> >> Hmm, I'm not quite sure, it is more than just mod. Maybe reuse the
> >> "skeleton" term already in use in buildroot.
> > 
> >  AFAICS it does three things:
> > - make device nodes (mknod)
> > - change permissions (chmod)
> > - set ownership (chown)
> > 
> >  So skeleton is not really the right term, as it only refers to the mknod 
> > function again.  (Although not-yet-existing files and directories are created, 
> > that's not usually the main purpose for files and directories.)
> 
> In device_table.txt, it also creates the whole basic filesystem
> hierarchy, with folders (such as /dev) and files (such as /etc/shadow).
> So you will have to add mkdir and touch to your list. That is why is was
> going for skeleton,
> 
> >  FILE is also not a good idea since it also applies to directories and device 
> > nodes which are not really files.
> 
> Heresy! :)
> More seriously, I was speaking about files with the Unix meaning in
> mind, but it is true it can cause confusion.
>
> >  A complete name would be _NOD_MOD_OWN_TABLE, but that's too long and too 
> > cryptic :-)  Plus, we might want to add things like setting the utimes etc. in 
> > the future.
> 
> I agree.
> 
> >  The functionality is in fact comparable to install - copy files and set 
> > attributes (except for the copy part).  So we could use _ATTRIBUTE_TABLE. 
> > Unfortunately, 'attributes' could also refer to the e2fs file attributes, 
> > which are a different thing entirely (cfr. man chattr).  Or 
> > _FILE_INSTALL_TABLE.
> 
> This one seems good to me. Peter ?

They're all operations (create or change) on file-system entries so
maybe like ..._EXTRA_FS_OPERATIONS or similar?
