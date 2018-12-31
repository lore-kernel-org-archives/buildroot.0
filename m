From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 16:06:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/gettext: Turn into virtual
 package
In-Reply-To: <CAMw6YJLfzWh+=5NVkjO=TPiZ75KdOw6x-qApgPUeV+mUMKYqOg@mail.gmail.com>
References: <20181223150448.21980-1-vadim4j@gmail.com>
 <20181223150448.21980-2-vadim4j@gmail.com>
 <20181230181026.3ce6aca3@windsurf>
 <CAMw6YJLfzWh+=5NVkjO=TPiZ75KdOw6x-qApgPUeV+mUMKYqOg@mail.gmail.com>
Message-ID: <20181231160614.0f7e9f0b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Mon, 31 Dec 2018 06:03:30 +0200, Vadim Kochan wrote:

> > I'm not convinced by how this virtual package is handled in Config.in.
> > In fact, if you apply both of your patches, it's broken, you have:
> >
> > config BR2_PACKAGE_PROVIDES_HOST_GETTEXT
> >         string
> >         default "host-gettext-gnu" if BR2_PACKAGE_GETTEXT_GNU
> >         default "host-gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY
> >  
> So looks like it needs to be enabled by default "host-gettext-gnu" but should
> allow to set "host-gettext-tiny" if BR2_PACKAGE_GETTEXT_TINY was forced
> by the user ?

No, I don't think that's what we want. Is there any reason to use
host-gettext-gnu, unless BR2_SYSTEM_ENABLE_NLS is enabled ?

If not, then I think we should:

	default "host-gettext-gnu" if BR2_SYSTEM_ENABLE_NLS
	default "host-gettext-tiny" if !BR2_SYSTEM_ENABLE_NLS

> May be I don;t have a view of a whole picture, but for me it looks simple -
> by default gettext-gnu is selected when ENABLE_NLS is set, but
> gettext-tiny should
> be selected by force choosing the BR2_PACKAGE_GETTEXT_TINY

We don't need BR2_PACKAGE_GETTEXT_TINY at all. Just make the virtual
package behave properly, using gettext-gnu as the provider when
BR2_SYSTEM_ENABLE_NLS=y, and using gettext-tiny as the provider when
BR2_SYSTEM_ENABLE_NLS is not enabled.

>. For the "host"
> case - the similar case with the only difference that "tiny" might be
> selected if NLS is disabled.

Why would one want to use the full gettext when NLS is disabled ? When
NLS is disabled, you don't care about message translations, so the
dummy implementation provided by gettext-tiny should be enough.

However: this is a massive change in Buildroot. Most people are
building with BR2_SYSTEM_ENABLE_NLS disabled (that's our default), so
such a change will mean that everybody will switch from one day to the
other from gettext-gnu to gettext-tiny.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
