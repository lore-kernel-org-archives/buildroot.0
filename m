From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 16 Mar 2020 08:05:48 +0100
Subject: [Buildroot] pigz download hash failure due to v prefix removal
Message-ID: <CAAXf6LWaOTe4Oi8SwkgXHTWX=G2VokyO87M5XM5evP_HmcFW4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Commit 69808c7536de5a67dc8bc363f4b56e0097d6a9d1 removed the 'v' prefix
on many FOO_SOURCE variables to align with release-monitoring.org.
While doing so, also the tarball names changed from e.g.
foo-v1.2.tar.gz to foo-1.2.tar.gz. And due to this, also foo.hash is
changed (same hash, but different filename).

Unfortunately, there could already have existed filenames without the
'v' prefix, but with a different hash. One particular case is pigz,
but I think the problem itself is common.

Commit 542891d6700e487ac89035a5b0e79ea1d31d8544 changed the pigz
download URL from its website to Github. With this change, the
filename changed from 'pigz-2.4.tar.gz' to 'pigz-v2.4.tar.gz'. As the
file was slightly different, the hash changed too.

People/organizations that have a local download mirror, are using
pigz, and already had a copy of 'pigz-2.4.tar.gz' prior to commit
542891d6700e487ac89035a5b0e79ea1d31d8544, will now get download hash
failures after upgrading to Buildroot 2019.08 or later (anything
including 69808c7536de5a67dc8bc363f4b56e0097d6a9d1).

Regarding possible solutions:
- upgrading to a newer pigz version: 2.4 is from 2017 and no new
version exists. So not an option.

- replacing the 2.4 release tarball by a git-commit-based download of
the same version. Possible, but not ideal.

- keeping the original tarball name by setting PIGZ_SOURCE explicitly. Like:
PIGZ_SOURCE = pigz-v$(PIGZ_VERSION).tar.gz
and additionally reverting the hash file change.

The last solution seems the best and easiest one to me.

For other packages than pigz, I'm not sure how to proceed. The
situation only occurs if all of the below conditions are met:
- the filename without 'v' prefix has been valid at some time in history
- a copy of that file without 'v' prefix is present in someone's mirror
- the version of the package is not updated between the previous
version of Buildroot used and the version updated to (2019.08 or
later, at this moment most likely 2020.02).

Input welcome.

Best regards,
Thomas
