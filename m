From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 12:36:33 +0100
Subject: [Buildroot] [PATCH 1/2 v3] vboot-utils: new package
In-Reply-To: <4c9ac9c66d52a2760002718d0827b1c146633aa1.1447714688.git.alex.suykov@gmail.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <4c9ac9c66d52a2760002718d0827b1c146633aa1.1447714688.git.alex.suykov@gmail.com>
Message-ID: <20151224123633.6740e4d3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Tue, 17 Nov 2015 01:42:21 +0200, Alex Suykov wrote:
> Chromium OS verified boot utilities.
> 
> Needed for signing kernel images and manipulating bootable
> partitions on media intended for Chromebooks.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

I wanted to apply this patch, but it fails to build. It forgets to link
with the OpenSSL library that has been built in $(HOST_DIR)/usr/lib.
Can you have a look? To reproduce, make sure you don't have the
openssl-dev package installed on your system.

    AR            libvboot_util21.a
    LD            futility/futility_s
    LD            futility/futility
    LDcgpt        cgpt/cgpt
/home/thomas/projets/buildroot/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/futility/cmd_create.o: In function `do_create':
cmd_create.c:(.text+0x42a): undefined reference to `PEM_read_RSAPrivateKey'
cmd_create.c:(.text+0x5fa): undefined reference to `RSA_free'
cmd_create.c:(.text+0x65e): undefined reference to `PEM_read_RSAPrivateKey'
cmd_create.c:(.text+0x680): undefined reference to `PEM_read_RSA_PUBKEY'
cmd_create.c:(.text+0x962): undefined reference to `RSA_free'
/home/thomas/projets/buildroot/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/futility/cmd_show.o: In function `ft_show_privkey':
cmd_show.c:(.text+0x875): undefined reference to `d2i_RSAPrivateKey'
cmd_show.c:(.text+0x901): undefined reference to `RSA_free'
/home/thomas/projets/buildroot/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/futility/vb1_helper.o: In function `ft_recognize_vb1_key':
vb1_helper.c:(.text+0x1141): undefined reference to `d2i_RSAPrivateKey'
vb1_helper.c:(.text+0x1159): undefined reference to `RSA_free'
/home/thomas/projets/buildroot/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/build/futility/vb2_helper.o: In function `rsa_from_buffer':
vb2_helper.c:(.text+0x4): undefined reference to `BIO_new_mem_buf'
vb2_helper.c:(.text+0x1a): undefined reference to `PEM_read_bio_RSAPrivateKey'
vb2_helper.c:(.text+0x33): undefined reference to `BIO_ctrl'
vb2_helper.c:(.text+0x45): undefined reference to `PEM_read_bio_RSA_PUBKEY'
vb2_helper.c:(.text+0x55): undefined reference to `BIO_free'
vb2_helper.c:(.text+0x61): undefined reference to `BIO_free'

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
