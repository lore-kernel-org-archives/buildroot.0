From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 03 May 2015 11:43:14 +0200
Subject: [Buildroot] [PATCH] autotools-package: also handle
 pre-installed external toolchain in .la fixup
In-Reply-To: <20150502223434.GK13701@free.fr>
References: <1430603450-17855-1-git-send-email-arnout@mind.be>
 <20150502223434.GK13701@free.fr>
Message-ID: <5545EDB2.3090500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/15 00:34, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-05-02 23:50 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
>> The .la fixup handling looks for paths starting with /usr and assumes
>> that they are missing the installation prefix (i.e. $(STAGING_DIR)). It
>> already handles the cases that $(STAGING_DIR) itself and $(BASE_DIR)
>> are under /usr, but it does not yet handle the case that a
>> pre-installed external toolchain is under /usr (and tracks that fact
>> in some .la file). For instance, if you use buildroot to generate a
>> toolchain with HOST_DIR=/usr/local/some_path, this problem will occur.
>>
>> Fix this in the same way as $(STAGING_DIR) and $(BASE_DIR), but in
>> addition check that TOOLCHAIN_EXTERNAL_INSTALL_DIR is non-empty. For
>> internal toolchains, it is empty and the sed expression would fail.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Reported-by: Carlos Soto <csotoalonso@gmail.com>
>> Cc: Carlos Soto <csotoalonso@gmail.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I however wonder: shouldn't we do that .la munging in a hook that we
> forcibly add to the list of post-staging-install hooks, so that it is
> run even for those packages that redefine their _INSTALL_STAGING_CMDS ?

 I had the same thought... Even more: it is not really tied to autotools-package
because generic packages may also use libtool, so it could go directly into the
.stamp_staging_installed code.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
