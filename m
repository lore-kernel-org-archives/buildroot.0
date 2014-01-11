From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jan 2014 00:48:53 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <1389368384-1332-1-git-send-email-martin@barkynet.com>
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
Message-ID: <20140111234853.GE3391@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2014-01-10 15:39 +0000, Martin Bark spake thusly:
[--SNIP--]
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> new file mode 100644
> index 0000000..37ed746
> --- /dev/null
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# ca-certificates
> +#
> +################################################################################
> +
> +CA_CERTIFICATES_VERSION = 20130906
> +CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
> +CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20130907T154615Z/pool/main/c/ca-certificates

It's a pity we can't get that from a trusted channel (ie. https instead
of plain http). Sigh... :-(

I know we do not do that for the other packages, but I'd like that we
check the authenticity of that specific one. There's no point in adding
a security-related package that we can validate in the first place.

I'd suggest we do that with a _POST_DOWNLOAD_HOOKS, something like:

CA_CERTIFICATES_CHECKSUM = SHA1-hash
define CA_CERTIFICATES_VERIFY_CHECKSUM
    hash=$$( sha1sum $(DL_DIR)/$(CA_CERTIFICATES_SOURCE) |cut -d ' ' -f 1 )
    if [ ! $${hash} = $(CA_CERTIFICATES_CHECKSUM) ]; then
        printf "ERROR: $(CA_CERTIFICATES_SOURCE) has wrong SHA1\n"
        printf "ERROR: Maybe the download was MITMed\n"
        exit 1
    fi
endef
CA_CERTIFICATES_POST_DOWNLOAD_HOOKS += CA_CERTIFICATES_VERIFY_CHECKSUM

I don't know what others think of it. Peter, Thomas, others?

> +define CA_CERTIFICATES_INSTALL_TARGET_CMDS
> +   $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/ca-certificates
> +   $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
> +   $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
> +   rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
> +
> +   #remove any existing certificates under /etc/ssl/certs

Usually, we add a space after the sharp symbol, and we start comments
with an uppercase letter, as for all sentences:
    # Remove any existing certificates under /etc/ssl/certs

> +   rm -f  $(TARGET_DIR)/etc/ssl/certs/*

[--SNIP--]
> +	#create symlinks to certificates under /etc/ssl/certs

Comment: ditto.

> +	cd $(TARGET_DIR) ;\
> +	for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
> +		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
> +	done ;\

That last trailing  ';\' is unneeded. It works because you have a empty
line below.

> +	#create symlinks to the certificates by their hash values

Comment: ditto.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
