From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 22:47:55 +0200
Subject: [Buildroot] [PATCH v3 5/9] python-pyftpdlib: fix
	byte-compilation with Python 3
In-Reply-To: <1462133720-409-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462133720-409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462133720-409-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+ZMQD4=Q2UtYbUSktbPNnnLdS-6X3HvK+j_hAJ-P9t_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sun, May 1, 2016 at 10:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit adds a patch to python-pyftpdlib to make it byte-compile
> properly with Python 3. Until now, this wasn't causing any problem as
> a byte-compilation problem was not a fatal failure. But upcoming
> commits will make it a fatal failure, so it needs to be fixed.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-fix-splice-for-python3.patch              | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/python-pyftpdlib/0001-fix-splice-for-python3.patch
>
> diff --git a/package/python-pyftpdlib/0001-fix-splice-for-python3.patch b/package/python-pyftpdlib/0001-fix-splice-for-python3.patch
> new file mode 100644
> index 0000000..f284b48
> --- /dev/null
> +++ b/package/python-pyftpdlib/0001-fix-splice-for-python3.patch
> @@ -0,0 +1,38 @@
> +Fix Python 3 byte-compilation problem
> +
> +Bug reported upstream:
> +https://github.com/giampaolo/pyftpdlib/issues/381
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/pyftpdlib/splice.py
> +===================================================================
> +--- a/pyftpdlib/splice.py
> ++++ b/pyftpdlib/splice.py
> +@@ -125,7 +125,7 @@
> +     # Single accept, we'll clean up once this one connection has been handled.
> +     # Yes, this is a very stupid server indeed.
> +     conn, addr = sock.accept()
> +-    print 'Connection from:', addr
> ++    print('Connection from:', addr)
AFAICS python-pyftpdlib is available for python2 and python3.
This could break runtime with python2, unless splice.py already
contains: 'from __futur__ import print_function' before any import
statements. In the latter case, care to mention it.

> +
> +     # Set up some subprocess which produces some output which should be
> +     # transferred to the client.
> +@@ -138,7 +138,7 @@
> +     # We need the integer FDs for splice to work
> +     pipe_fd = proc.stdout.fileno()
> +     conn_fd = conn.fileno() #pylint: disable-msg=E1101
> +-    print 'Will splice data from FD', pipe_fd, 'to', conn_fd
> ++    print('Will splice data from FD', pipe_fd, 'to', conn_fd)
> +
> +     transferred = 0
> +
> +@@ -162,7 +162,7 @@
> +
> +         transferred += done
> +
> +-    print 'Bytes transferred:', transferred
> ++    print('Bytes transferred:', transferred)
> +
> +     # Close client and server socket
> +     conn.close()
> --
> 2.7.4
>

Regards,

-- 
Samuel
