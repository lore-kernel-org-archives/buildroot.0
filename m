From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 2 Feb 2015 10:20:34 +0100
Subject: [Buildroot] [RFC] pkg-generic: add per-package staging directory
In-Reply-To: <20150131230200.0490cafe@free-electrons.com>
References: <1422602264-4725-1-git-send-email-Fabio.Porcedda@gmail.com>
 <20150131230200.0490cafe@free-electrons.com>
Message-ID: <CAHkwnC-fd3jfMSrdatA9bf_HtL-oTXs7D3ep53A_804EVM4kww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 31, 2015 at 11:02 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 30 Jan 2015 08:17:44 +0100, Fabio Porcedda wrote:
>> This commit add a per-package staging directory under output/stagingof/
>> to improve build reproducibility, because it prevents that a unspecified
>> dependency affects the build.
>>
>> It also help to enable default top-level parallel make.
>
> Thanks for attempting to look at this complicated problem. However,
> there is a fairly fundamental flaw in your proposal:
>
>> +$(2)_TARGET_CPPFLAGS += $(foreach dep,$($(2)_DEPENDENCIES),\
>> +     -I$(STAGINGOF_DIR)/$(dep)/usr/include)
>
> How is this going to account for headers installed in subdirs
> of /usr/include ? Those are normally discovered using pkg-config for
> example. But with your solution, pkg-config will continue to return
> paths in the "common" staging directory.
>
> My perception is that it's not really feasible to have one staging
> directory per-package, because it means that pkg-config would have to
> know, depending on which library it is asked to provide information
> for, should use a different sysroot dir.
>
> I believe the only solution is to create a temporary staging directory
> in which you copy/extract only the libraries that are explicitly listed
> as the dependency of the package being built.

It's just that if there is a way to don't copy files it will be faster.

Now I'm preparing a new version that do as you said.
I will try to use hard links if possible.

BR
-- 
Fabio Porcedda
