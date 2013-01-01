From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 1 Jan 2013 22:50:52 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
 create users
In-Reply-To: <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMKP7WNGQV5xvmjf9gB_FOtxmvDZhYAMTSun2w=_ZOn9vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

2013/1/1 Yann E. MORIN <yann.morin.1998@free.fr>:
> Packages that install daemons may need those daemons to run as a non-root,
> or an otherwise non-system (eg. 'daemon'), user.
>
> Add infrastructure for packages to create users, by declaring the
> FOO_USERS variable that conatin a makedev-syntax-like description
> of the user(s) to add.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
[snip]
> @@ -252,6 +259,11 @@ information is (assuming the package name is +libfoo+) :
>    You can find some documentation for this syntax in the xref:makedev-syntax[].
>    This variable is optional.
>
> +* +LIBFOO_USERS+ lists the users to create for this package, if it installs
> +  a daemon you want to run with a specific user. The syntax is similar in
> +  spirit to the makedevs one, and is described in the xref:makeuser-syntax[].
> +  This variable is optional.
> +
>  * +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
>    is released.
>    This name will appear in the manifest file produced by +make legal-info+.
> diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
> index 27517b3..fffdac9 100644
> --- a/docs/manual/makedev-syntax.txt
> +++ b/docs/manual/makedev-syntax.txt
You could add this in a new file...
Why should makedev-syntax.txt contain syntax details for makedev and mkusers?

> @@ -54,3 +54,68 @@ and then for device files corresponding to the partitions of
>  /dev/hda       b       640     0       0       3       1       1       1       15
>  -------------------------------------------------------------------
>
> +
> +[[makeuser-syntax]]
> +Makeuser syntax documentation
> +-----------------------------
> +
> +The syntax to create users is inspired by the makedev syntax, above, but
> +is psecific to buildroot.
s/psecific/specific/

> +
> +The syntax for adding a user is a space-separated list of fields, one
> +user per-line; the fields are:
> +
> +|=================================================================
> +|username |uid |group |gid |password |home |shell |groups |comment
> +|=================================================================
> +
> +Where:
> +
> +- +username+ is the desired user name (aka login name) for the user.
> +  It must be unique.
> +- +uid+ is the desired UID for the user. It must be unique, and not
> +  +0+. If set to +-1+, then a unique UID will be computed by buildroot.
s/buildroot/Buildroot/

> +- +group+ is the desired name for the user's main group.
> +- +gid+ is the desired GID for the user's main group. It must be unique,
> +  and not +0+. If set to +-1+, then a unique GID will be computed by
> +  buildroot.
ditto

> +- +password+ is the crypt(3)-encrypted password. If prefixed with +=+,
> +  then it is interpreted as clear-text, and will be cypt-encoded. If
s/cypt-encoded/crypt-encoded/

> +  prefixed with +!+, then login is disabled. If set to +*+, then login
> +  is not allowed.
Multiple prefix is allowed/supported; it could be explicitly mentioned.
Is the prefix order important?

So, the clear-text password itself should not starts with any prefix character?

> +- +home+ is the desired home directory for the user. If set to '-', no
> +  home directory will be created, and the user's home will be +/+.
> +  Explicitly setting +home+ to +/+ is not allowed.
> +- +shell+ is the desired shell for the user. If set to +-+, then
> +  +/bin/false+ is set as the user's shell.
> +- +groups+ is the comma-separated list of additional groups the user
> +  should be part of. If set to +-+, then the user will be a member of
> +  no additional group.
> +- +comment+ is an almost-free-form text.
> +
> +There are a few restrictions on the content of each field:
> +
> +* except for +comment+, all fields are mandatory.
> +* except for +comment+, fields may not contain spaces.
> +* no field may contain a column (+:+).
> +
> +If +home+ is not +-+, then the home directory, and all files below,
> +will belong to the user and its main group.
> +
> +Example:
> +
> +----
> +foo -1 bar -1 !=blabla /home/foo /bin/sh alpha,bravo Foo user
> +----
> +
> +This will create this user:
> +
> +- +username+ (aka login name) is: +foo+
> +- +uid+ is computed by buildroot
ditto

> +- main +group+ is: +bar+
> +- main group +gid+ is computed by buildroot
ditto

> +- clear-text +password+ is: +blabla+, will be crypt(3)-encrypted, but login is disabled.
> +- +home+ is: +/home/foo+
> +- +shell+ is: +/bin/sh+
> +- +foo+ is also a member of +groups+: +alpha+ and +bravo+
> +- +comment+ is: +Foo user+
[snip]
> --- /dev/null
> +++ b/support/scripts/mkusers
> @@ -0,0 +1,348 @@
> +#!/bin/bash
> +set -e
> +myname="${0##*/}"
> +
> +#----------------------------------------------------------------------------
> +# Configurable items
> +MIN_UID=1000
> +MAX_UID=1999
> +MIN_GID=1000
> +MAX_GID=1999
> +# No more is configurable below this point
> +#----------------------------------------------------------------------------
> +
> +#----------------------------------------------------------------------------
> +USERS_TABLE="${1}"
> +TARGET_DIR="${2}"
> +shift 2
> +PASSWD="${TARGET_DIR}/etc/passwd"
> +SHADOW="${TARGET_DIR}/etc/shadow"
> +GROUP="${TARGET_DIR}/etc/group"
> +# /etc/gsahdow is not part of the standard skeleton, so not everybody
> +# will have it, but some may hav it, and its content must be in sync
s/hav/have/


Regards,

-- 
Samuel
