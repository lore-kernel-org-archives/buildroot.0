From: Luca Ceresoli <list@lucaceresoli.net>
Date: Tue, 13 Jul 2010 22:14:18 +0200
Subject: [Buildroot] [PATCH/RFC] Download sources from Git (and more)
In-Reply-To: <1279032219.2887.78.camel@dubciaranr1.verifone.com>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
	<1279032219.2887.78.camel@dubciaranr1.verifone.com>
Message-ID: <4C3CC91A.1060502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quotient Remainder wrote:
> Ar Luan, 2010-07-12 ag 23:30 +0200, scr?obh Luca Ceresoli:
>   
>> Hi,
>>
>> this patchset is a tentative generalization of the DOWNLOAD macro, as
>> recently discussed in mailing-list, in order to allow BR to obtain
>> package sources not only as tar files from http/ftp, but also using
>> other protocols.
>>
>> I borrowed some pieces of code from Quotient Remainder's patch, but this
>> approach is substiatially different.
>>
>> The feature list is short: I deliberately wanted to be minimalistic
>> but set up a clean infrastructure that can be extended later.
>>
>> Even though these patches are quite polished, please consider them as
>> a proposal for discussion. If there is general consensus about the way
>> I propose, I'll be glad to add a bit of user documentation as well.
>>
>> In the first two patches I prepare the ground by making the download
>> infrastructure more general. The DOWNLOAD function is replaced by a
>> per-package $(PKG)_DOWNLOAD, whose value is computed automatically
>> from the site URL but can be overridden. The good old wget system is
>> modified to fit in the new framework.
>>
>> In the third and fourth commit I add DOWNLOAD_GIT, which is relatively
>> straightforward given the whole infrastructure is already in place.
>> The place where the repository should be cloned might not be appreciated,
>> but I definitely think it should go in output/, as it is part of
>> buildroot's -well- output, not of the package "recipe".
>>
>> The last patch is surely *not* meant to be committed. It's just a
>> minimalistic example of a package downloaded via Git, and would be
>> replaced by user docs as stated above.
>>
>> Luca
>>     
>
> I personally quite like the approach here and think it's more flexible
> than the patch set from Maxime, but have two questions.
>
>  - Why not make the usual tarball in $(DL_DIR) with "git archive
> --format=tar ... | gzip > $(DL_DIR)/..." instead of the self-described
> "hack" of skipping the extraction step?  I suppose it's slightly faster
> since you avoid the compression and decompression time but that mightn't
> be too significant.  I just wonder if the skipping of this stage may
> have some side effects especially if packages have custom extraction
> steps.
>   
That would be very simple, and probably cleaner as you noted.
I think it's worth doing after all, since it would save download time for
example after `make clean`.
I'll code it as time permits.

>  - Do you see any way of making it possible to use the clone as the
> actual working copy used by buildroot?  That is, if I clone a repository
> (as opposed to archive) and then want to make changes, I can edit the
> source and build/test the change in-place (in output/build/package/) .
> As it stands with this patch set, I think it would be necessary to make
> a change in the source in $(PKG_NAME).git/, commit the change, note the
> new version, change the package version in package/Makefile to the same
> and make will then copy an entire snapshot to a new
> build-dir/pkg-newversion/.
>   
This would certainly be useful, but hard to couple with the current
buildroot structure, as Thomas pointed out in this thread. A discussion
would be needed before such a thing.

Luca

>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
