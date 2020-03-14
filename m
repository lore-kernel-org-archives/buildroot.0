From: Andreas Naumann <dev@andin.de>
Date: Sat, 14 Mar 2020 22:52:25 +0100
Subject: [Buildroot] [PATCH v6 09/28] package/quazip: Convert to qmake
 infra
In-Reply-To: <20200311224256.7be1235b@windsurf>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-10-anaumann@ultratronik.de>
 <20200217225752.74c34031@windsurf>
 <d138dcb2-3946-c711-d8ee-a7491bf5979b@andin.de>
 <20200311224256.7be1235b@windsurf>
Message-ID: <1514f29e-9df5-e02c-73fa-488b5b24cc36@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11.03.20 22:42, Thomas Petazzoni wrote:
> On Tue, 18 Feb 2020 11:00:07 +0100
> Andreas Naumann <dev@andin.de> wrote:
> 
>>> A prefix of $(STAGING_DIR)/usr looks wrong, as prefix is normally where
>>> the things will be once installed in the target. Do we really need to
>>> do this change?
>>
>> I agree it's probably not how PREFIX is intended to be used. But after
>> all the project doesnt seem to support cross-compile/install properly as
>> you can see by the need to explicitly set INSTALL_ROOT to a different
>> path for staging/target.
> 
> Well, in fact the current install procedure for quazip is perfect, as
> you don't have to do the horrible rsync dance that we have to do for
> other Qt packages. The fact that INSTALL_ROOT is different for staging
> and target is *perfect*, it is exactly how INSTALL_ROOT should be have
> in the first place: like DESTDIR.

I couldn't agree more, if INSTALL_ROOT would not touch the destination 
for host-files the whole thing would be much easier. But, it isnt that 
quazip works better than other packages. It's just simpler because it 
doesnt have any files for host.

> 
> So I'd really like to see more research done on this package, to
> understand why we need to bogus PREFIX= variable, and make sure it
> behaves like other packages.

Again, the quazip.pro uses PREFIX directly as install destination, so 
it's not aware of the sysroot/staging pathes for cross-compiles. This 
could probably be changed by patching it to use QT_INSTALL_PREFIX (which 
is prefixed with the staging path, if set). I dont know if that would 
break other things or require more changes in the project file.

> 
> It would in fact be ideal if all other Qt packages could properly
> support INSTALL_ROOT like quazip does.

See above. It's not the packages fault but how qmake uses INSTALL_ROOT.


best regards,
Andreas


> 
> Best regards,
> 
> Thomas
> 
