From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Dec 2012 18:01:21 +0100
Subject: [Buildroot] [PATCH 1/2] target: add option to set the root
	password
In-Reply-To: <0e6cac687daa80382f614d38c6394947eab5d892.1356739565.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 29 Dec 2012 01:07:33 +0100")
References: <cover.1356739565.git.yann.morin.1998@free.fr>
 <cover.1356739565.git.yann.morin.1998@free.fr>
 <0e6cac687daa80382f614d38c6394947eab5d892.1356739565.git.yann.morin.1998@free.fr>
Message-ID: <87a9svtqxq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Add an option in the menuconfig to specify a root password.
 Yann> If set to empty, no root password is created; otherwise, the password is
 Yann> encrypted using MD5 (MD5 is not the default for crypt(3), DES-56 is, but
 Yann> MD5 is widely available, not-so-strong, but not-so-weak either).

 Yann> Add a check for 'mkpasswd' as a new dependency.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Arnout Vandecappelle <arnout@mind.be>
 Yann> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
 Yann> +config BR2_TARGET_GENERIC_ROOT_PASSWD
 Yann> +	string "root password"

The rest of the options here are capitilized, so I've done that as well
here.

 Yann> +	default ""
 Yann> +	help
 Yann> +	  Set the initial root password (in clear). It will be md5-encrypted.
 Yann> +	  
 Yann> +	  If set to empty (the default), then no root password will be set,
 Yann> +	  and root will need no password to log in.
 Yann> +	  
 Yann> +	  WARNING! WARNING!
 Yann> +	  Although pretty strong, MD5 is now an old hash function, and
 Yann> +	  suffers from som weaknesses, which makes it susceptible to attacks.

s/som/some/

 Yann> +target-no-root-passwd:
 Yann> +	$(SED) "s/^root:[^:]*:/root::/" $(TARGET_DIR)/etc/shadow
 Yann> +
 Yann> +target-root-passwd:
 Yann> +	root_passwd="$$( mkpasswd -m md5 "$(TARGET_GENERIC_ROOT_PASSWD)" )"; \
 Yann> +	$(SED) "s,^root::,root:$${root_passwd}:," $(TARGET_DIR)/etc/shadow
 Yann> +

The 2nd sed only applies if the root passwd isn't set (E.G. running make
menuconfig and changing password + make doesn't work), so I've
simplified the two cases together to simply replace root:[^:]*: with
root:$(TARGET_GENERIC_ROOT_PASSWD_HASH): which is either the empty
string or the mkpasswd -m md5 output.

-- 
Bye, Peter Korsgaard
