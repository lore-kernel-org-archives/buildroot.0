From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Tue, 13 Feb 2018 22:01:17 +0100
Subject: [Buildroot] linux-extensions and OVERRIDE_SRCDIR
Message-ID: <20180213210117.GZ9763@australia.be.alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The linux-extensions mechanism works by using a PRE_PATCH_HOOK to do 'stuff'.
This means that if LINUX_OVERRIDE_SRCDIR is set by a user, the extensions do not
actually do anything, because there is no patch step, and hence no patch hooks.

While one can argue that for regular packages, _not_ patching in case of
OVERRIDE_SRCDIR is a sensible thing to do, I find it a bit odd in case of the
linux extensions.

Moreover, even for regular packages, I have heard several reports of users
actually expecting/desiring patching to happen even with an OVERRIDE_SRCDIR.
And similarly, with SITE_METHOD = local.

One method to solve this is to introduce a new variable, e.g.
FOO_PATCH_LOCAL, that would retain the patch step in the sequence of steps.
This variable can either be set by a user in local.mk, alongside
FOO_OVERRIDE_SRCDIR, or by a package in the case of SITE_METHOD=local.

For the use case of kernel extensions with OVERRIDE_SRCDIR, it does require the
user to be aware of the fact that the extensions work via patch hooks.

Feedback? Alternative solutions?

Thanks,
Thomas
