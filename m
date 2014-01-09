From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Jan 2014 00:59:17 +0100
Subject: [Buildroot] [PATCH v2] ca-certificates: new package
In-Reply-To: <1389201330-2420-1-git-send-email-martin@barkynet.com>
References: <1389201330-2420-1-git-send-email-martin@barkynet.com>
Message-ID: <20140109235917.GH3713@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2014-01-08 17:15 +0000, Martin Bark spake thusly:
> CA certificates used for SSL based applications.  The package installs CA
> certificates to /usr/share/ca-certificates and creates symbolic links under
> /etc/ssl/certs.  For example, the existing libcurl package will use these
> certificates for https urls.  Based on the debian ca-certifcates package.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
[--SNIP--]
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> new file mode 100644
> index 0000000..6cf2e7a
> --- /dev/null
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -0,0 +1,39 @@
[--SNIP--]
> +    #generate symlinks to certificates under /etc/ssl/certs
> +    ( \
> +      cd $(TARGET_DIR) ;\
> +      for i in `find usr/share/ca-certificates -name "*.crt"` ; do \
> +            ln -sf ../../../$$i etc/ssl/certs/`basename $${i%.crt}.pem` ;\
> +      done ;\
> +    )

As stated by Thomas, this is not very nice.

However, you do not need to enclose the command in-between a ()-pair,
since make will spawn a shell for each 'command', and thus the cd is in
effect only in that shell. That is, the following line:

> +    $(HOST_DIR)/usr/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs

Will be executed in another shell.

Also, your use of basename is weird. I'd use this instead:
    `basename $${i} .crt`.pem

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
