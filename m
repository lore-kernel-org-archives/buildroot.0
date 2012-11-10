From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 01:30:55 +0100
Subject: [Buildroot] [PATCH] target: add option to set the root password
In-Reply-To: <1352503739-20083-1-git-send-email-yann.morin.1998@free.fr>
References: <1352503739-20083-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <509DA03F.1020501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 00:28, Yann E. MORIN wrote:
> Add an option in the menuconfig to specify a root password.
>
> If set to empty, no root password is created; otherwise, the password is
> encrypted using MD5 (MD5 is not the default for crypt(3), DES-56 is, but
> MD5 is widely available, not-so-strong, but not-so-weak either).
>
> Add a check for 'mkpasswd' as a new dependency.

  Is it necessary to put the plaintext password in the .config?  Why not put the
output of mkpasswd in the config, and explain in the help text how to produce
it?  Perhaps even with vVj0miIkzZnhg as an example of password root.  So the
help text could be:

	  Set the root password. This is the crypt'ed password as it should
	  appear in /etc/shadow. To create a password, use the mkpasswd
	  utility: "mkpasswd -m md5" to create an md5-crypted password.

	  Note that sha256 or sha512-crypted passwords are preferred, because
	  md5 is somewhat compromised. However, the default busybox
	  configuration does not have support for sha256 and sha512 passwords.

  Obviously, this will make the patch much simpler, as there won't be a need
anymore to distinguish between no-root-passwd and root-passwd.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
