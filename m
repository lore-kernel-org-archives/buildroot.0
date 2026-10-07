Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5435ECA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 03:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 999D980EFA;
	Wed,  7 Oct 2026 03:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjG-PaONVkST; Wed,  7 Oct 2026 03:30:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 93F5C80EE1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791343850;
	b=T3EfRBYhbphLHh/rXpbIG3zO2X9SLQx6LlOGS8dx+8VjW9qpKxUBwsZrNSKx7zUYVT6Y
	 pUjxcEysJ4ebLpx+uGyOOFOdUBQj4MgupZ4Ok6/EgkMoT5j0HlI1e5HiB1rYE3Un14qJy
	 NGeOgPIrQC/52wCcNbHEdCV0PORCfa7y4FppojNYrWXvcFwpVbNoq8jEyqCpqTEMe8FO3
	 CcPVxNfN2XbPhzly+tWlMo1vduuPfPrSNZJ7oLQgsQeFUSuqcrW2Z6wpXcdcWkIFKQrym
	 eelM0QnaRrN2hAMTSdd9zGASGFiO/NTqtQZxbbfSc7nsT0MQft60r9SFkjmA4nbu4eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791343850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ye7ZKTtvxdVE+1R/JVHD6dLx50Oz9O1uXCseRt7cXfo=;
	b=atpKKESHM/s/OzqoY+vxZaRWugy6OQJxDfEttKOsJOxJhSUbLFMi/W61rsf2fWaxCSp4
	 rNZf4IuXN98Y93KwbM5BQ/OHViZ+3DITmHpzLoV4lddgs15McmMNlT/rTlOQ1RfHOZq9Q
	 4L+BwoCtLs35Kho/i6TXvGvCJl0ZyShCrJ3yRaaQ2bztcHTHN7vNdZg0zA4jDj+ybHUZ4
	 IjcrBkjQ7Ih4SS03lwJOw7H7mE2ybXZkzCFRE/o/O+Ro6XeCb5Qjt/nGAP1KdGQY4rarx
	 D7WyqaOtFLgfYoDlVoA2tOFs0bGTMx3e2SSXibyz6ni5QnddXGRIPPSHPSIQTt1tYcw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O1zPKCYg;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791343850;
	bh=ye7ZKTtvxdVE+1R/JVHD6dLx50Oz9O1uXCseRt7cXfo=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ngv7pyJNQmlgjVti3OisiwFJ+k1BRrxLAjhU9q7tSadlxDgYgyDZg/6aUAEMT1RG0
	 aoETD/E9fKEKURkXvZB4q7NYQpuVdHYHYS7E2Fa6/vi7xfp8ym++W9tYigBM7gL1Nf
	 jVPikpLeHWoZnphupeQ946aBd4rtBO1Snwv7oNKnFKoTcQd6y4DDj384bKfLG8upkL
	 VUC4ozqH8wSgEZAzHrMtwpp3Dl7Bm5z0ZsmDfishAAN6pmeRYC/34qEW4zcuYSOaQi
	 SG2Qm0prq/zJD61S1M7uV9LTvbStjiQkCSB6Ni+PKSWLpnLA3iMkJBAUjpwBxspeab
	 OMNHISA1b0Uzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F5C80EE1;
	Wed,  7 Oct 2026 03:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4465922B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 03:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361EE80EE1
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 03:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1CBy0pPfuqK for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 03:30:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D247E80EDF
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791343829;
 b=fMNDKLwQ+49hXMOx9SUtWZI141LHsQ1cfvlXxUYrunsbIhXq3bQ7tfxVwK+Ezj64f/qx
 eF1blhy+kO+KO/Mn5jDOOazB6euT8SmopUG6tXwrjcVSFt3uMSvOqiARUWL9TU03ftsMQ
 dSwKIl+nyzMtzKNCHbUBTsAouxmLdp8M0uQhDSABn1Gyg5F70xHYhn0dqb4f0ZJ9cFDkM
 OEc7J2MmoKAXwnIvmJQneZWZYA+57BPHHeyvnSr1Rxy/JnXHUh5w30V9+AI9ogQvHA9t7
 tLcCH8xlNjfae4/uMGHVKKqeJKelqrcNyOQ3RiHVMuRYgWjTPKjnC/nByW00ii19DxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791343829;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=PbpaeBU3p8yFtPOOr+jii/2ejCGymm86BmOgTUxKRzE=;
 b=EcK1FVj0Z5jAvzaRTZrwSOAHbCBakxes9wq9PhhZ33BPFd+pQVPOdq6Vq2TE3t2dAmUI
 fWZ3dRyaMXoEpCe+3Rb88zFknBWhZk3bZUq7C+O9MPPxvzYkGN0dLTwnJazF4eCIoV8TK
 bUfSFWVYGSDOjpLb6FBmmg2Uvr5VutSnrSShhlSgw5SC4N77pVieJ6LhWMlxGJc9tOAq1
 FctjIjhvCobUFoDrKsrJ7LIQhw/TvGKFktWzQkT7Ig6lzyOQhkAZTJ3pugF1GPpI8to2S
 F1aDIEz+77f1oya7gFkM2tosuqY1EiBA7UhmfgYf1vE6eXQgCJB5HZNuXLMp9PrVu8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=O1zPKCYg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O1zPKCYg
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D247E80EDF
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 03:30:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so12813755e9.0
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 20:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791343826; x=1791948626; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PbpaeBU3p8yFtPOOr+jii/2ejCGymm86BmOgTUxKRzE=;
 b=O1zPKCYgXpporZp2/qT/sU3OjjSILrXcLZnOmxZ72l12PzYj3D7DmYhjNNO2/8wAqH
 X4fbrtqhclDtkMFiFAEZXwyqKBZEu4rURf7JQbLj+GaPh5aVsfRICd4rI1QxSMMHR2sb
 bEvFJLEGB5Zmlem19V74FRnm/XUgCiHsX+09qxYOF7XGBNAVkGfDmUyztOvJeWY0YVfE
 e4iNvMl2gjLhzRAb2xag6unI2wNSN7EZelGjpwvPh3yczwecakTXZckBQFVuyL+cv+ny
 tbo5mgbZtLpX7fkH6u5DYynZjJ9s71xDRe/xysVWuI4OCyMAAXVjlknXcxWZmh3dI42/
 hMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791343826; x=1791948626;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PbpaeBU3p8yFtPOOr+jii/2ejCGymm86BmOgTUxKRzE=;
 b=HzgC9m5IMDo4eFZ8h6g+lMe4cTi+WEHzeGEgrLMPYxKaETAi9/zLT6ZATwwFLHau9d
 GqeOLs+mQOepzvf6F20GQfOGIWMl+3L2+taefXlY2D4rYwRxvCXJHihXkgHGfpXM4uPV
 B35DLZ7cTL2O3T8fYK73N6I9bXZDCwQlLzTL7UvikcPa8+SFcBPVit+tbGRpPFqogEIm
 fXeWeVbkM/Of7r/4xADRlWOKdCAI6n8mWRfZ/7x9p883A3rY6mpetJwk4hEW/ETG5XR0
 Je2hh02FnF6BocMcvhSWeNsnzXWQgmL86YAMWBXQAm4+OqpFoMjArh8X6NFafqnaX/Z+
 S1DQ==
X-Gm-Message-State: AFuF++mcPSA0nR0wDFIiHKSoySBR8O4WE+V9fKkO7nLQMtg9ezj3Dqc1
 yqYmtjp/ANGCd49OOOp3llDkjNneGrtk6ymi2O4mJfIBhdwnmvUTpDh/ljelZAXQ
X-Gm-Gg: AYBFou3qNLvUolnH3TFjrPwuqgr8vm1NHipQZFl7Xg1odQASDH9Bp4wwoWK/8uZvA1/
 Wvof9D8FWXcRY4/yQwIIHSIBZM92Sf1TktPz0dUiIO1aYVIAd3w7w0srx0foFkLfGOF7H5aWqxe
 MzknnWcJ9vQbc8k2++QVQgEAkIkj90WxTARsJQTmtLflAOO/EIii10U4UVOE4ftbozGsQ7esim1
 9I22Dj49uBevKRS8KeSAE63mA7P87OlwHmoP2ekXvO/I+yFEfKT8/qN1XyZRN1dHHyh7K5h68Jj
 nsmDjX2Gyhh4xjZmw0HWm+B3N8UqcvQ0FZZjXCRVfqf5QdzWL4XVjsHkeV9F7yxDo8U0ofkJXiV
 WYs6hRFJxv0/Wuf+I56eyaG8lYAGxZ3THQDk7lgD568hc9etMDJLbyta7FQUIUiU618dTN0NyN5
 1e+LtbkrQcJA8sYXf+Kn5sEnQ1XXZSkMFlUNo1DsfKp0s5dLp7SZeJjUSp967mkWpI/DUFqXV5l
 A==
X-Received: by 2002:a05:600c:810c:b0:49f:ff73:9971 with SMTP id
 5b1f17b1804b1-4a180420274mr10030265e9.18.1791343825623; 
 Tue, 06 Oct 2026 20:30:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c5b9d6sm103150685e9.13.2026.10.06.20.30.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 20:30:25 -0700 (PDT)
Message-ID: <6ac5bcd1.f5ac67e6.1cf1b3.ab9b@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 07 Oct 2026 03:30:25 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-06
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-10-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2026.05.x  |  1  |  1  |  0  |  2  |
  2026.08.x  |  1  |  0  |  0  |  1  |
    master   | 60  | 158 | 18  | 236 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 18
                     host-rust | 18
                   dante-1.4.4 | 5 
            host-gauche-0.9.12 | 5 
                host-gzip-1.15 | 5 
            host-libtool-2.5.4 | 4 
host-python-types-psutil-7.... | 4 
              erlang-26.2.5.21 | 3 
            host-go-src-1.27.0 | 3 
                 libclc-23.1.2 | 3 
                    lua-ev-1.5 | 3 
                  readline-8.3 | 3 
                       unknown | 3 
                   atop-2.13.0 | 2 
                   ccrypt-1.11 | 2 
                coreutils-9.12 | 2 
              cryptsetup-2.8.8 | 2 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202602 | 2 
      freeradius-server-3.2.10 | 2 
          host-binutils-2.45.1 | 2 
            host-binutils-2.47 | 2 
    host-gcc-bare-metal-16.2.0 | 2 
                host-gmp-6.3.0 | 2 
host-google-breakpad-f49c2f... | 2 
            host-mtools-4.0.49 | 2 
                host-odb-2.4.0 | 2 
                 host-tar-1.35 | 2 
                  iozone-3.508 | 2 
        ltp-testsuite-20260529 | 2 
      passt-2026_07_28.f8df3f1 | 2 
 qcom-db410c-firmware-1034.2.1 | 2 
              tailscale-1.78.1 | 2 
            18xx-ti-utils-R8.8 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                  davfs2-1.7.3 | 1 
             docker-cli-28.5.2 | 1 
                enscript-1.6.6 | 1 
firmware-utils-c42a3bc53da8... | 1 
             fontconfig-2.17.1 | 1 
               freetype-2.14.3 | 1 
fs/cloop/cloop.mk:33: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
                      gdb-16.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                     gmp-6.3.0 | 1 
                   grpc-1.83.1 | 1 
                     gzip-1.15 | 1 
host-am335x-pru-package-5f3... | 1 
host-autoconf-archive-2024.... | 1 
           host-coreutils-9.12 | 1 
       host-gcc-initial-15.3.0 | 1 
                 host-gdb-17.1 | 1 
       host-gettext-gnu-0.22.4 | 1 
       host-libunistring-1.4.2 | 1 
                host-m4-1.4.21 | 1 
               host-make-4.4.1 | 1 
    host-mender-artifact-4.4.1 | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
                   iperf3-3.22 | 1 
                  kexec-2.0.32 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
                 libiconv-1.19 | 1 
   libtorrent-rasterbar-1.2.20 | 1 
                libupnpp-1.0.3 | 1 
               lightning-2.2.3 | 1 
          linux-5.10.254-cip72 | 1 
               linux-pam-1.7.2 | 1 
               madplay-0.15.2b | 1 
                  ndisc6-1.0.7 | 1 
                 nettle-3.10.2 | 1 
   openvmtools-11.3.5-18557794 | 1 
               pax-utils-1.3.7 | 1 
                  pdmenu-1.3.6 | 1 
                   perl-5.42.3 | 1 
                 pixman-0.46.4 | 1 
               procps-ng-4.0.6 | 1 
               pulseaudio-17.0 | 1 
                rdma-core-62.0 | 1 
               read-edid-3.0.2 | 1 
                  redis-8.10.1 | 1 
        s6-linux-utils-2.6.2.1 | 1 
                  screen-5.0.2 | 1 
       sp-oops-extract-0.0.7-1 | 1 
               tcf-agent-1.8.0 | 1 
           uboot-tools-2026.07 | 1 
                 uclibc-1.0.59 | 1 
               valgrind-3.27.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b4591f9154b378af2afa172c30758ec30d044c36 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/9a0522a931993babe6c259ff0aa0bd7402349dcd | ORPH
   x86_64    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/962ae3eb968e5a8c267ae743aac39294bab13fd2 |     
    arm      |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/8e7160b46185684a6ff3359020d9b793f3bf3073 |     
    i586     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/c8b66d2d64943491462482f5c0ad178d4ebd3e73 | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/fd8a9cdd359b6eb0d6fb4ece9961ecd4a52740ab | ORPH
powerpc64le  |         coreutils-9.12         | NOK | https://autobuild.buildroot.org/results/ca4c1c40ac68a3f13849688abfe0a2a00a53a5d2 | ORPH
    i686     |         coreutils-9.12         | NOK | https://autobuild.buildroot.org/results/f8fdec13024c5fff4eb9e79c8be96fee5a0950ac | ORPH
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/a068f075e85e56d74a250c78a62e550eb756376a |     
  aarch64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/fbef21f907ce8c0f004aa003259be63aa31fa718 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/1d1bf8f2199eaa30aaa78377c8aeba58e2f6e395 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/34baec7b0489cdc2a83a85d86aa418c929808358 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d532180e8bd18810568ee11eadb844d1be24cf0d | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6448332025074614678569c385a8d460d4df7556 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/80d191411fd27b87420c2bb532b6866960c1da6c | ORPH
  riscv64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/fd1043aab98cb0c3bec2bb606ec66d48404b2ccc | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/982138fcb72449a788f643c5e6e08c4d07182c2f | ORPH
    i586     |          davfs2-1.7.3          | NOK | https://autobuild.buildroot.org/results/fb9d2d93e1e86affc04d1598b28233035afdce4a | ORPH
    arm      |       docker-cli-28.5.2        | NOK | https://autobuild.buildroot.org/results/aa6f181b4d2adcd498b303ee507ba5207ed47750 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/0592f55517544fddf530952c6233543d31c9ba88 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/590ceeb51ca2e1c362a4409ea307154dbe420802 |     
   s390x     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/81d396f1ea0bc0dceb041814d32cab01e5158aa8 | ORPH
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/39082b8be5dee7ee66c2a5f1aada6873d8fd5242 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/a04f6ff7e4ccd5db54924e27f9103ecfd5e0fb9c |     
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/ff09f33a01455c706306fcc64e66f754e0ca3c03 |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/29d7140bd07b3cedd5b417bd1a3d3f9252959047 |     
   x86_64    |       fontconfig-2.17.1        | NOK | https://autobuild.buildroot.org/results/506ff209f5011d28c39235c2eca25d838c9879ef | ORPH
powerpc64le  |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/ed768a0710d0c282aea2d6b1b84e6cec3b978468 |     
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/5b3e8369f43839ae1070faed6eaf61311e44cb91 |     
  mips64el   |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/d19f75b23e1b0f3d72694cfb2e64cb5298f664f7 |     
powerpc64le  | fs/cloop/cloop.mk:33: /home... | NOK | https://autobuild.buildroot.org/results/42eb45f3e976a01d12621430649f1f6d9bc68855 |     
    i686     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/51e8d7d9c1355b6ad466f941150e7af3824258e8 |     
    i686     |            gdb-16.3            | NOK | https://autobuild.buildroot.org/results/94ac5ebba49bd28a1be148d806417ccd26a1aa17 | ORPH
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/5b949a8b8f1b9b574bf11f2031c1e40d19117bbc | ORPH
    i686     |           gmp-6.3.0            | NOK | https://autobuild.buildroot.org/results/0695ca43d3f724b6997bc4419b10195c3741fce9 | ORPH
    i686     |          grpc-1.83.1           | NOK | https://autobuild.buildroot.org/results/4ce0467e243f7842a13ce55214e3fffd025dbd17 |     
    i686     |           gzip-1.15            | NOK | https://autobuild.buildroot.org/results/3888c94a501a9b4fb06cbf264bde31fba89cd4eb | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/93949e78f3587ee223e40109dbd0e7bea6c53f9e |     
    i586     | host-autoconf-archive-2024.... | NOK | https://autobuild.buildroot.org/results/8616af5c73ab21f10dddf839c83d8993629ddd7a | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/efc14c8f7a26cc35465e7d93bd4a628bfc03f593 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/a22b177eb41b6c305c420acdf18ea5aecd4668d2 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/941d0a1e0b5b99fe46e97df0eb1d1e8586a8f702 |     
    i686     |       host-binutils-2.47       | NOK | https://autobuild.buildroot.org/results/190b1ed8b081262de4233512fd8eca4c99035933 |     
  riscv64    |      host-coreutils-9.12       | NOK | https://autobuild.buildroot.org/results/22ecfbc43db38ae4120f9b802d63e77016cb2ce8 | ORPH
  mips64el   |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/70af7f5d96cdde6d0a46549f8e3d6827aec071c3 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/25bbb5fe84e44373a42e896a5e81b45d11a69863 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/c804bb03060f53fa15fee80cd95f6872911f56a0 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/fe31ec74d0773b166be7d00fee28821f3c899e3d |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/27e8ef811f0d97a0f6664b93b458dc927aa54bc6 |     
 microblaze  |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/48dbaeda02d398a0c55cb53374b6437846fb7671 |     
    i686     |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/500a681c8b1aa7d224404d47b2237f6fbe6148bc |     
  sparc64    |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/55024879273dc3e4dff169de40c1559a40293bdb |     
  aarch64    |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/a42a3d392ce5dafeb04c762375d37917735a44e7 | ORPH
    i686     |    host-gettext-gnu-0.22.4     | NOK | https://autobuild.buildroot.org/results/45971f8402250cef3b712405dea5564c86ea6e38 | ORPH
    i686     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/bdec66674df4377b3c7968a0e86ac9b87552abf2 | ORPH
    i686     |         host-gmp-6.3.0         | NOK | https://autobuild.buildroot.org/results/6c96ff070b875ebc10ae8f809d8a2e0bcbbc850a | ORPH
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/56ffe9dad8ed15128f50044afb0a7df1b71b0f0a |     
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/7d66ca2c10768c7d5a5a93c310254b42eeff5b94 |     
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/d09d83eb3bd4dd7686ee907bf916a3724fef1154 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/11fd152f3aa6c21fd7331aeb59b6a31de695dfd4 | ORPH
  riscv64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/83f13d0512b9050acf33596cf7775777bd906ddb | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4483a6215c00dab6222a459f1c5cd2aec588bd55 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7fe58c9de64f7ff3cdcd478a3e17faa17ef9db50 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/863aa762f6b120cc36eab7c8e40a1e1a8acaedc0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bea6472d388168f861ad1e2b114400480ffad912 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7487cc0b5036f3e5abbd8b413117176c76f589d2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a5eb3c0d964f4ab7ff53af03fe44171d87bc8cd9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d2c5bb906b317398fa3929c333d5916c9e26661d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dd128849536f85f39c9cdde632a1f9348d9976a9 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fb7ab17eb5bc20fe5ba1e45212fc4c2442ff7cea | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6adeea1f02b719cbb25408cbcf53431859945ad0 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4a2e9ba846f005d20214a45514273a95c8539511 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/40077168bc954cc13bb04ba01d7fdaca16214c76 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/63fa761e85254e4bf90bb08bc5792c467a84dba1 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/857795d294d1ebcd2362349f904041f660d84eaf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/64ec544103dce480cd5c1f60515f43c72a607fe8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c9529966aa2611f6a8df97d24619a78e70364214 | ORPH
    arm      | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/372917b5a05e333052858dfc8c139f127e639475 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/9f0c1279c93018e34e21cb95f95587b26842fd6c |     
   s390x     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/df0b1a59aeed03005ec2115250347638a2d29300 | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/5e1af9ca65bdc7f611a93cde40b03494fc3cf814 | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/4e161b10db3f9a5337be116f401b5b31d2699ef8 | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/8f8a5b70b9ffe23d265e33fa70e07b87490a4c86 | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/b012a62fae13b62482f4c84a525c1d0724a831c0 | ORPH
  mips64el   |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/eaa7be535d454ca79c94d9c6e5438d91106eabd9 | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/4c595ef4b59829ceb3a1e8a65f3b92fc5c0c3dd0 | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/5faeb05d122d1e630a490d74bfb20327b6122c04 | ORPH
    i686     |       host-libtool-2.5.4       | NOK | https://autobuild.buildroot.org/results/4725dcea0aa8a2307adec2d6d9edd8fa2225cee8 | ORPH
powerpc64le  |    host-libunistring-1.4.2     | NOK | https://autobuild.buildroot.org/results/c1e3defeca2c779a8672cd0f73372fef4352eeeb |     
    i686     |         host-m4-1.4.21         | NOK | https://autobuild.buildroot.org/results/7de28ec23982043403a8a1c67ce370ea382c59bf | ORPH
    i686     |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/129f7d0cb3ae38f90a1ec2672e6bd0e8e5854d5d | ORPH
   mips64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/64663018cde897f894d874154dd6278ca8268038 |     
    i686     |       host-mtools-4.0.49       | NOK | https://autobuild.buildroot.org/results/63ba76b93ced635a1bb5c67e08d5030f7057e54b | ORPH
    i686     |       host-mtools-4.0.49       | NOK | https://autobuild.buildroot.org/results/c175a16b4e0d407303ccec79f7abaf8cca81ee36 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b9fd341ee2b35fd296f80501b96bbff78cbbf415 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/385ea11f9658fef6566fc7a1ee69004f69c69d1a | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/c62ecb7a6f33680c4f515e135955a0aeacbc090b |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/3f6c45b18f0ac39932486139d45ef5fbb89b3094 |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/5531a126f36fbd866888975e45635b5846715d51 |     
   s390x     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/38383b4236ba2640c344f4b214d82e565b6b8f20 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/04a160b832f989b0adf4a921ca65563c06abd5b7 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/e6d853bf41515acb73b00653ddf6b7842d14df73 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/9a08228295e42fa941447a4fbffac00178715fa3 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/fa0b5b2ec9ffa51638da59958a451730a60cfb6a |     
  aarch64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/24a9a2f68b621938ee384fb2f0bdd35c604ead94 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/cd9a158e88df31dd65882d6ff6c0bcda738fcd50 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/df1e66d53a484270ea51d41b1b216c8b72e91bee |     
  powerpc    |           host-rust            | TIM | https://autobuild.buildroot.org/results/02b2fc6ba7329852d7bf6ae4935c120c4de47b3e |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/7b972c724d81e57a857804909025d37bcad12e97 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/c4589cf97faa1e03e3de3368921a92076b344713 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/bc0da93053b98bd90d0afa8013e2ea628b9374ea |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/012e0bacafd464bd03631e3867ca2ef950f2905c |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/412182f55b2b2f1fcc89029cedf324ed5bd4adeb |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/07b3669323edac054397164e8a61486ea07d014a |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/f8f0bb46611b3c7bb251813202a3762d619de467 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/8db6d1fdb057c2d05f82a3bff8f5e6e1d29bcb6c |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/54ff99c49e0a1d3d74b45da740ab4f7a2948e7b5 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/8bac87e20dd05cab76fc573a17b6d9298dedb054 |     
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/809a93a553fa98a464155fe8d2831da0a75aad16 | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/8e0fe7eab540ed207746af1d2451d440b3c2c65d | ORPH
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/e68607764e744e192f0c480270b10a0a6b56170b |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fd069761023f68d96fbec3fd68c182796f0baf81 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/88e52fe63cbf55e7261eccb224b1d218900589c5 |     
 aarch64_be  |          iperf3-3.22           | NOK | https://autobuild.buildroot.org/results/075679ac5fa6d2cce375569b557379d572f46427 | ORPH
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/ab2561765bdaa41ebb63ae9bf0caf09b8d4486f8 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/ef0616dc1bc95de9730da53aa22a4fc5ccc85f8d | ORPH
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/dabd7c091db7cfd5acb82ace6462b02fdb13db3a |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/80881ba6d4384565f5b592dffcb2fbefe936a616 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/13f7104607937d929d8289e4b3ed16610f656fa2 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/1deb863473408b8355a9be70bb7b9562fe6d9e3d |     
  riscv64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/fadcdc0508bcfc1c68de888eec144d2fc3cb7bf3 | ORPH
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/82c71eedcdec29e7f6e6928a165780010dcfe7bf |     
    i686     |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/701fd0d792cb14584e3f7a5ff0777f3b89c892b0 | ORPH
    i686     |  libtorrent-rasterbar-1.2.20   | NOK | https://autobuild.buildroot.org/results/5e4bd9919b86951b1d7bd2f5971c2889e004a570 |     
    i686     |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/3b67b02a254ea87bb9fe88c0289a350cc91341c0 | ORPH
    i686     |        lightning-2.2.3         | NOK | https://autobuild.buildroot.org/results/9880ca72728f20351094761092817e724a6b8250 |     
  mips64el   |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/094e9e9b2ae529d97ed06e3478a5276f98f2bc52 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/94d6c614fc68c8651091c81ceec37eb1931ee43c | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/14a05bdc44343e62f910856894cf6bde9dfe0879 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/23088c87779ec1bec27ea0b8ac9ffb0c7c5febe0 |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/709253f7580d5ca33ecf0c97d562fc800803594a |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/45f4a3ee7e48be1b20db22eb49d38308b844e90b |     
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/15b854f0cf6c424d0641bc236ac331ce2c4a39f0 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/7346c23c3cd8876996eedb9d80e47646f7302860 | ORPH
  riscv64    |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/48d3ed5dde81ab704db8e98942b992bd71679eda | ORPH
    i686     |         nettle-3.10.2          | NOK | https://autobuild.buildroot.org/results/fd79034039a3e5530bda8fca0391b5ece6546a95 | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/5c554c0b1391b394631a30f932bcd480648a0533 |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/ae64358051de72b06b61b4bb58d2dab854b79835 | ORPH
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/50efe7123e41b41ab09aed947e4b3867236500e2 | ORPH
   s390x     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/e89a4c0d7ba81498556acdafe05253bd8c3cca17 | ORPH
    mips     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/4c17750d1b07b6e15bf1e67b2ac1e72efe0e9085 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/621c3c05c7915d6737b56278157aafdf7be6abf3 |     
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/1085707e78998db11d80f713dc585f4532b2f196 | ORPH
  mips64el   |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/5e796f386023117b656ee4f4c3cfa7568231b490 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/1a68801150bc7136f225607c5b9b197cc55b21b0 | ORPH
  mips64el   | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/706ae6e6ea207c7003c533922d200e893e61142e |     
  riscv64    | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/a188943dd0661605b658a5d1b2c4776b536f1dca |     
  mips64el   |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/e8d5cd185e1ec0db8187b68e8a78b44c34289fb8 |     
    i686     |        read-edid-3.0.2         | NOK | https://autobuild.buildroot.org/results/302dd81c03f5657fab1cc9d494260dc3ec28ba91 | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/fcfa8d64c68e66a43b7c1ff1b0afa3dcd4d53b8c | ORPH
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/5cd6de909acc5de6c3c179fe0166c32fc3603fc0 | ORPH
    arm      |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/48cdebe19afa03b427fdd3214163d328d6d841d8 | ORPH
    i686     |          redis-8.10.1          | NOK | https://autobuild.buildroot.org/results/57813a1bd75f2293f9c0235ccdcf2543cb6d0c02 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/00c277c5c3d142ea7fcd09bd45d93770ac00470b |     
    i686     |          screen-5.0.2          | NOK | https://autobuild.buildroot.org/results/49459ea7b73e281fdd11bf3e0691feb6c3475f17 | ORPH
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/4942aea9c6fddef84d31d90aea581bac59b98c8c |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/c1cfa5352cacb8b5cd129a41248bacf77c5e5c62 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/fc694fceb1cf5728132791796cb312494dc0cd50 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/369b90852d1488c30fc1498c6c97f1fe05c44e1c |     
  mips64el   |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/38ae0450dcb4419c321bb3cb9a13adcac353ca59 | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/9589d0f82c7b4ffac80480f8894fe27d1194e4c6 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/6b622781a4a00296899842357e69437060432b19 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/dc9c2ab6cad27da036190fe15efa159ed434487b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/abf01842ba575ac60cd8749ba47ce6aa8a7afbe9 |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/9aa203bc4caa38b3e8c40ed894978a6380657b79 | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/e64260dae4cd2a5b38600dd726aa45e1c4e582d9 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

libfutils-c326ce0cc2a735438... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/ef451c7633472c8aa33c6505c0097cc3d813aa5a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.5 | 1 
            host-go-src-1.26.6 | 1 
  wireguard-tools-1.0.20210914 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/74f0282958c7cc74db19c9bbce6cc3c33e304c5f |     
    arm      |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/337176993b7df5091f5688439f34f4e920b4f54b |     
    i586     |  wireguard-tools-1.0.20210914  | NOK | https://autobuild.buildroot.org/results/e547b7087a4e369e1452d537838e0f55a366350d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
