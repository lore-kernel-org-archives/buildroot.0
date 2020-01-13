From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jan 2020 23:33:53 +0100
Subject: [Buildroot] Potential issue with per package directory hard link
In-Reply-To: <CA+Vmb_ebsMv-UQ8pJoOr0W-pwmU_rdwRJDRgE8hw2paVDE05-A@mail.gmail.com>
References: <CA+Vmb_ebsMv-UQ8pJoOr0W-pwmU_rdwRJDRgE8hw2paVDE05-A@mail.gmail.com>
Message-ID: <1535bff6-53c4-4695-d8b7-f183d556a970@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/01/2020 19:09, Paul Kasemir wrote:
> Hi Thomas et. al,
> 
> Regarding this line in the per package directory core changes:
> https://github.com/buildroot/buildroot/commit/c4e6d5c8be6ada8e7c60950e3b499c55d48761cb#diff-4ba3c73225b6850a34a3077526e4105cR146
> 
> Using hard links is a good idea, but it also lets you shoot yourself in the
> foot a little bit.
> 
> Take this example
> PackageA builds and installs FileA to staging
> PackageB builds and modifies FileA is such a way that FileA doesn't work
> anymore
> 
> Since it is a hardlink, FileA is now broken for all packages depending on
> PackageA and you would need to rebuild both PackageA to get a working copy
> again, even though PackageB was the one that corrupted the file.
> 
> Not sure if you can come up with another way that would enforce a new file
> created if the file is modified. Using sed -i 'expr' FileA is fine, but
> using echo "something" >> FileA will modify all versions.

 An easy way to error out in such cases is to chmod -R a-w the install
directories. Not ideal though because you probably want to restore permissions
afterwards.

 However, we've already concluded that modifying files is really a problem with
per-package directories. If package A, B and C all modify the same file, and B
and C both depend on A but not on each other, then the order between B and C is
not defined. So when the final host, staging and target dirs are created by
combining all per-package directories, we will get the result of either B's or
C's edit, but not both combined.

 Whether such edits are made with echo>>, sed -i or even rm makes no difference,
the net result will always be wrong.

 The solution is to introduce the check-unique-files step again to make sure
this doesn't happen, i.e. no two packages touch the same file.

 Regards,
 Arnout


> I've thought of using unionfs, but that would probably add a lot more
> complication than its worth and you would have tons of mounts you would
> then need to manage. I've also tried inotify, but it didn't seem reliable
> and is also a bit complicated to manage.
> 
> I just thought I would bring this to your attention in case you weren't
> already aware of it.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
