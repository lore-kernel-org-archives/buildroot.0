Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40BECC6B1A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 03:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABA96083F;
	Wed, 14 Oct 2026 03:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDyE8q-sUpOa; Wed, 14 Oct 2026 03:29:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2D1FF60849
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791948554;
	b=DXRf9NYDMyvOXMVIbrY20YKbDXrmXnRzSU7+jUNFq1HwFml8uWlkjEVAkPOkKQgMfAKy
	 iqg9f+WNzBkHJ7rbxvIaimp2y6D21nErRPzj1e5uGB20vB+5lAuTQIcSuO4gAIBBg/tG8
	 T1GvHFPHKryW0lcMdIUX2Z4E0MHW4JCc3IfTOFuPkVuh1thW0RZvPe989vkQtH+JgL59b
	 egqchhfxSbX84/ACM8qulfAO8v1XsUQX3P0Js9U/c5mu+T0I+ofvT8h1r/KieU4Nr/ewN
	 kuMkZ6YluRkSAppGMFfVSMNDAUXwvn+uwzWKcekK6UHSOOZJoORHJkwY9Xgj4NPWBmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791948554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ydN6fQjwSVxb36DyC3cw42ttlC3k+/0Cz2yCOAg3VBU=;
	b=kIOaLNF0W3OIzXgGGJLQZuLeJ64m6zAJwVmFDTSoY3fpCTYW+V5kkHUXS1hsXwbpzUcV
	 o9hDXOHoRuZ3Yg+H4DTCzHAqioazZERdoZhf2E9fjuTuM/00MYF9Px0sO36eeDsz6IvZt
	 Bh0ef3QMfqUBCFgK8gWrEo1fkwvMzlz3zaQth0saQ3UYRn+XnghxO68s3MRT7BvM5zX4o
	 B9SEQfh313g5+3We6vhCN53VtbytUtULMz9nOZQHJONbNFDFJbf5BBgNSJz2m0GG9psBM
	 d+j6KIL6cjSKfe8P+qsYYnLCKRENTdLISKf/IkjQCHY5HliyWjVVVqS0epM8OIT5M1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791948554;
	bh=ydN6fQjwSVxb36DyC3cw42ttlC3k+/0Cz2yCOAg3VBU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gZfeWJWXgZY5jeFmYsviVHToAA/YrzGy/2/id/hzNjSUP8+Ux8uSMlnQ1T3S9AEQe
	 T9oQC7gRDLLhrEnkTOSlVAPjA+83biWmZ6OMB4ue/JSGtYVIKniEV0Q1qMCY+UnNNP
	 ItdyDm6JnH4XR+n7Mbzd6n91Lj0j88nHVUIlgflk3vTIFe7FE/6bgx8zFm3ROVcckf
	 rzc6rHsimnaRxC6ihY8H07E9rTMZgq9UXjaYFt6RyCHUlcR2cbOXcqh8ij48sE1l7H
	 ZGPnFP7Nh1HUtLgq1Yn4CcgNyNaVzjKHoN3Nyav/qH8Nqa7e5s91wQD2AjY9UIXRxR
	 sHlAy8MjechsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D1FF60849;
	Wed, 14 Oct 2026 03:29:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CE68255
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 03:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECFAA406B9
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 03:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTnNrucDyruO for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 03:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E2D86406DA
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791948550;
 b=jxhFOEjgqQLuhutYOD3ZV+Fk+NaEx5yk7vHpS6N0By8BE+g6Mn5mpVmYHt3boxbRE94G
 UtAb4xc6rkYmEqqlbtD0crDXz64i+B2odvUYR8wJF5wlhEOCSjD4xd/GrGsO4s4f8s4CV
 lSmxsatoM3fQUtCcKmXnQvSNN4EB+RHvO7k1Tw/a3g4smpqys8c/aEvzw7688Okp7AYcT
 VxpnvYexH9xiHdX+ZWREufsUcyxY+IyL4hj/WY8Ab/gLAnVpRhE4BLOa8EW79t8LO/e4+
 BgT66S27GsmU35jaS1iL5QKq9A2UlzGd546ssdTS6slkXuW/UzLSXN7F4eryjneea/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791948550;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=x5JKFiwagFe7dsLopbJoDTUhoqE/7ri4e7UkNmp7ffY=;
 b=rmpNlNbur/dVrcibN9eBnFn7O8of1wwwyC/qpP1ot625MvB3E8kOMjdjK32ewpKNu48a
 HLs/Rbgf36oU1+YQXKZ1GMuU5xdKlszwb/oxkpael+45ttg4NGxLg0G5M5GkACfLxcHAo
 gCiQZocYuXWfINLm78zWR4dbkIt2SkoS6HYPWxOwvAZ2lo/3KfXSljOvFjSOcVyIrzn6C
 H40mnMR1lT9BjFFe18Y1UToC2iDqn8MbOFYaDRmMudJz2Z8yX/ma0HzQicCswW0Gtliix
 24ikFDkTvkik1k5yiXolowX5mvK9wFIlTVDdLUqDKEZsGLOgEGDfN1mj8+xkTfAgBTw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=E02IA52V; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=E02IA52V
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2D86406DA
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 03:29:08 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a021c809e3so35386295e9.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791948546; x=1792553346; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=x5JKFiwagFe7dsLopbJoDTUhoqE/7ri4e7UkNmp7ffY=;
 b=E02IA52VR3ttxyMQMMEtvoPyrWumqJ7Bymi0LLASyQx4Z0NO13HR57DCZStHvRxd3n
 p5FlILWP0xoNcAWYePHjvv7iPwg+jpZoyNFchT5NayzF685kZs7W5dWivfj81r7b1Zs5
 fK0movNj8srGAsYioHRICrRzQPe6Rdo/elzXbO2BLpEIzKn9lONBK1w/5BsLhgeHyyzV
 CJZ7UTtvkDDUPv3AFnjKUw/67QtGZPThm5oPK4wV591UItfj9cfCDx8SICfCFjlWOas3
 sXHw4KmFUU0tAGEisjCe/aBMv1kWi6mLzkfThVIotyCbKsOIsmDpzIcZzGWo6HPK4t+l
 LkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791948546; x=1792553346;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=x5JKFiwagFe7dsLopbJoDTUhoqE/7ri4e7UkNmp7ffY=;
 b=pXyqV1RT4eABrNnUNh3xswFhZM7YJDU4cHgtSBS9f20Tm8ZGiK1x4B6wpMlOOwtkkK
 T155HmkLa4KACJ1PwjHJGHEektLdWeF/DiZu4IjrXOjuxNgWRbwMkgCy8lnXf9/I2zsN
 5rj2yEgon1qfkd9CqB3ULvTTkcF5wk8pCoODcxSx4Cbtt8JZkqMh7TgCLbudpcSyQApb
 YFkCOvbmCF24O4AS1l00JGFDNkpptXf2fu/EAHeifkCbqZ45cYmZV9ZvdR3a19Lqdlm4
 df7vautw1OOOy0HslwgvEPnHFeee40f4r6B2o1mlRXdhmSee0CqEfkEJYQWBuaOBHOlg
 b24Q==
X-Gm-Message-State: AFq9FYL6i/nmm0KZzPZXJqIxKjqd78bZ1iStz4WCzfPKDt0QyBFGcymf
 hJFP0HmQorDzJASdHwN7CTYA8mGKVx/BuTrsi0TY2EpPuU09NFGUPDPlLWituZTJ
X-Gm-Gg: AYBFou3xgywk24T6i3Oc2QYPupOeFlOEoq/Wv4mKHy8aI/BVMH101A54vCO4lvmCx3r
 7QusiA51IqATUV/zr6dsVsAvOEn8VEiMCIGnbq6+NzYsO4PQ2qRDuskIg91nlS1rvdlj4CpItJA
 Lkc7lLnXUjzAswInqiKzY5fVuwrpwaX5bVNBPHtndPhDNbLUEZf1K9WBYp0kC+B6wVl18qHKqz+
 yoX9XmNDTTknYYz7YJLtqNrQc/HnrJmX4aMwdb9P2pZcs/1hOFVuLy2L/EECWcETeFX/AG0XbvT
 lgyvQ/7OezKhxvZ57DPDVhJwdAkbq8iQ0g+0OAyxYIFmgHsdni4XFxNGdyDnoONRCmJCvmDh44E
 cGEwwcDTspA5uAqyHrxIoA1kiAlrh5zkKxoZYWUzetkouvw6+hxadS/1Kv1dZEZi3bWEjHE7fEr
 /dMdW0FhjpuIl8ipaCdf+fi9aThQKI9N3oLmTua6iBLtME80qeK69ECYgzCEHKyDod3cG/twca7
 A==
X-Received: by 2002:a05:600c:46cf:b0:499:b65e:49c9 with SMTP id
 5b1f17b1804b1-4a18e47ad5fmr315847375e9.10.1791948545886; 
 Tue, 13 Oct 2026 20:29:05 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac35dfsm9027572f8f.33.2026.10.13.20.29.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 20:29:05 -0700 (PDT)
Message-ID: <6acef701.4000cc3d.2e15bb.2adb@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Wed, 14 Oct 2026 03:29:05 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-13
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

Autobuild statistics for 2026-10-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 15  | 25  |  0  | 40  |
  2026.05.x  |  3  |  8  |  0  | 11  |
  2026.08.x  |  7  |  5  |  0  | 12  |
    master   | 62  | 198 |  2  | 262 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 19
              libmodbus-3.1.12 | 13
                       unknown | 10
                host-odb-2.4.0 | 7 
            host-gauche-0.9.12 | 6 
                 libclc-23.1.3 | 5 
host-google-breakpad-f49c2f... | 4 
                rdma-core-62.0 | 4 
am33x-cm3-fb484c5e54f2e31cf... | 3 
                    attr-2.6.0 | 3 
        edk2-edk2-stable202602 | 3 
                  ffmpeg-6.1.5 | 3 
        ltp-testsuite-20260529 | 3 
               tcf-agent-1.8.0 | 3 
                   bird-2.15.1 | 2 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
              erlang-26.2.5.21 | 2 
                 haproxy-3.4.4 | 2 
host-am335x-pru-package-5f3... | 2 
            host-go-src-1.27.2 | 2 
    host-mender-artifact-4.4.1 | 2 
                     host-rust | 2 
 ibm-sw-tpm2-rev183-2026-08-26 | 2 
                 lcdproc-0.5.9 | 2 
               libecoli-0.11.3 | 2 
              libopenssl-3.6.5 | 2 
               linux-pam-1.7.2 | 2 
                   ncftp-3.3.0 | 2 
python-remi-2022.7.27-37-g1... | 2 
python-types-python-dateuti... | 2 
                 rtptools-1.22 | 2 
              skalibs-2.14.3.0 | 2 
       sp-oops-extract-0.0.7-1 | 2 
                 uclibc-1.0.59 | 2 
               valgrind-3.27.1 | 2 
x264-baee400fa9ced6f5481a72... | 2 
             alsa-lib-1.2.16.1 | 1 
                   ccrypt-1.11 | 1 
                cifs-utils-7.8 | 1 
                cryptopp-8.9.0 | 1 
      docker-cli-buildx-0.25.0 | 1 
         docker-compose-2.40.3 | 1 
                 dovecot-2.4.5 | 1 
                  dpdk-25.11.2 | 1 
              e2fsprogs-1.47.4 | 1 
                    emlog-0.70 | 1 
              fluent-bit-4.2.0 | 1 
glibc-2.44-57-g34106fee698c... | 1 
                  gnupg-1.4.23 | 1 
            host-mfgtools-0.02 | 1 
host-python-types-psutil-7.... | 1 
           host-qt6base-6.11.2 | 1 
              host-rust-1.98.1 | 1 
                   i2pd-2.61.0 | 1 
            igd2-for-linux-2.2 | 1 
               iniparser-4.3.2 | 1 
                   iperf3-3.22 | 1 
               libepoxy-1.5.10 | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.88.3 | 1 
                libmdbx-0.13.6 | 1 
               libtalloc-2.4.4 | 1 
                libupnpp-1.0.3 | 1 
                 libv4l-1.32.0 | 1 
                libvips-8.18.0 | 1 
                 libzlib-1.3.2 | 1 
                linux-5.10.271 | 1 
                 linux-6.18.56 | 1 
         linux-headers-6.6.158 | 1 
              llama-cpp-b10702 | 1 
                    lua-ev-1.5 | 1 
                  mender-3.5.3 | 1 
                  ndisc6-1.0.7 | 1 
        network-manager-1.58.1 | 1 
                       nnn-5.1 | 1 
              ntfs-3g-2026.7.7 | 1 
                 openal-1.24.3 | 1 
   openvmtools-13.1.0-25218885 | 1 
            optee-client-4.9.0 | 1 
package/mender-update-modul... | 1 
                   perl-5.42.3 | 1 
        perl-xml-libxml-2.0134 | 1 
          pkcs11-helper-1.31.0 | 1 
       python-dbus-fast-5.0.14 | 1 
         python-serialx-1.11.0 | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
            qpid-proton-0.40.0 | 1 
        riemann-c-client-2.2.2 | 1 
                   rsync-3.5.1 | 1 
                      rtai-5.3 | 1 
rtl8189es-0a5d04114fac3c9f4... | 1 
                 rtl_433-25.02 | 1 
                    sbctl-0.18 | 1 
               soapy-sdr-0.8.1 | 1 
              tailscale-1.78.1 | 1 
                      tar-1.35 | 1 
               trousers-0.3.15 | 1 
uclibc-ng-test-132c6134d691... | 1 
vexpress-firmware-901f81977... | 1 
                    which-2.23 | 1 
                wtfutil-0.47.1 | 1 
          xdata_xbitmaps-1.1.3 | 1 
                 xenomai-3.2.5 | 1 
                    znc-1.10.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/73b5f020a9e798bbe9792f2e4e4ccf6007b676ec |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/5a4ad20b5f8f9c863d23cf495067d72d6f805b04 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/6c959cd94584fe546bcc6efd9b1c9f279b2fee4f | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/45713992aa2b2a32f2b2431c139814543676f08d | ORPH
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/10f14306cc1af6c134103cedee4b1e2c18ff36b6 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/72410f6b324766e9180e0d5f186a0f184f4cb762 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/2765d57860df7c52de33d4d8ee7ed0059b6b085e |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/c8a688c30a843b3cc54a8a7fcb67d4d15a135d88 |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/891be4719906a6beddbc3724ed09ac1842a435bb |     
  riscv64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/00e5b7816bf508b544039840d59f2e4700edba9f | ORPH
    i686     |         cifs-utils-7.8         | NOK | https://autobuild.buildroot.org/results/376236b00323daf4a98825c705da12daa2f6340b |     
    arm      |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/907397e1b9e01f3dd8434d88cee4f9cc89fa0c67 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7d316f9a2bc567702b3d89600e350fc00a928447 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c5ca53a2173e72a4bfb27ec9993d1c9e5a3d29b4 | ORPH
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/eb66e2b0b8916260f48936c51a66524c69058ecc | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/33ebe0f0110868fc6b313781a44cfc29aba55d19 | ORPH
   x86_64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/69190bff0e10f585f064d68dd6cfdfc2771986c5 | ORPH
  aarch64    |     docker-compose-2.40.3      | NOK | https://autobuild.buildroot.org/results/986099e69b81fe7dad592352a096b1b039b57431 |     
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/e22fca5b53ecc6ca31c2c9e4170c6563b0e9dc4d |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/ba155d44c1b0f49cdcce64b90d57a71ae2620549 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/2602cb1ef177de27335a1ff6c045b48df43677e4 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/6e3d00834db7f4f684f29ab13f6f9b8f5de4b18c |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/7a76643f72fc7f0cebf99cc693301c3544652d45 |     
   x86_64    |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/3a803c416e1a11e527c3889d3b00aeb2d2ee227d |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/cfe667b52bc8cd5fdcbe7044983698d2d4ac370c |     
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/61fc7abf926961cb4e150d54208dd02cbef723b7 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/b7785995ef0eb496b3cd0a5500256462d2cc6df5 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/f66fe4a2165b468072fd0943776cfcfecc489c72 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a3bcecdbfc65f0ce3c30e1cefe9a62d0aad36d12 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/06e983eb0afb292786a758c1fd34e23f0c7913da |     
    i686     |        fluent-bit-4.2.0        | NOK | https://autobuild.buildroot.org/results/93459d7f785412f7fd9b1777a8761166f52013d3 |     
loongarch64  | glibc-2.44-57-g34106fee698c... | NOK | https://autobuild.buildroot.org/results/d21dbc37504d29bb1b0f5079d6bf3fd240f7b21a |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/a3d4de1669f6a047b68542e7a84562b0a8f4e203 | ORPH
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/b31381d6e3f589574175bdf93e423dc9071e78ee |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/4f7cf40bdf70681751dc0d6c6db9025383d70ea6 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/4221d4a03c93c8adae3512a0029f6ca6537b0882 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/de47f57498ca600546fc72ffca9647a2d8477206 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/57c6020ebe00eb4f7cf6d8969cf719355d6988de |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/d88b8ed1591105e6f8380d06350162942fef7f19 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/2c5fd0b097d829854acee0290fd068356ab4a1e6 |     
   mipsel    |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/20816470bc60c82d40f978edb835da2c70343f2d |     
powerpc64le  |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/788ba4d21b0bd6764bba7c1fff3820303415424a |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/368d815aa5f7c03a4d3455603e1e1f24520c7187 |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/02d9ead1e086290220c047380a6cf359c534fcb1 |     
    i586     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/df26066f76a8661f4dec1d166725e585c2626236 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7f0f0b62ff28c0a054dbf4bc0c26e0bd0c90fa07 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a402f7d3efd15257b749445f46e3e840a5bf293 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a2045b3278e03592bcca2e508cff48eb41720fc4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6015d402df90f464827843c0e5a1f3a7236ae974 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/364441e977557e9b2b2298f8ded20273db4ad32d | ORPH
    sh4      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0922794438853e7da44beaf1e2b0010bc887756b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/10bca40db2aa4ab171cc51d09a7cdb78945781d1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0fc217a32bfea45cfaec8f48cdc153d82ea0e9a1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/327dd90bfab4baccf13bf49f075b9c4235a3d33f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0aa2397c2828d1413791be53333d1cd8aff8df1b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0185105586be49e81302c42186725ce7e331196 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4524484d897f54fe686e2f54660ab29a4dfc3666 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ba0a12ab11085fff10aae28209afbb85ddf32d83 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9726a83cdf594bb0bbae7de4295f53828338e574 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/506321faf613d79a415e092d6c1194c24582a01e | ORPH
   sh4eb     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ea6d623a4bcab8c8258c12d206e6948f956245ce | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/75b9f16190626f26f8bb8a4b723c29b3f0e0768b | ORPH
    m68k     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/04b921443d9d4126128fd7279d1c3bf04eb90cb6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6e24e9842047425d4ddcee9cf4ae339a2d27781f | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/03a59caa8691a1557d71d2f21486eb01b22f15c8 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cda1ee6746bd5871400c44265694716419154eae |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/1b102374d0a2ddb6358c6f130cef88a1f8f366e4 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/df396fa3b6c9d353f2b589102ac62d208d175c45 |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/d293a527d0c1695a19fd04989b5d3e50b7a549b4 |     
   x86_64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/41d3fa90b76a536ba41c774d1b49bc458c52de81 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/e764545b6c58740883f0560ac237b882b91e1beb |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/072606fd64ac2ba7ef47325ec06251e1aa43a0b9 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/f79f0c19e1f35424e4aee62b6568fb8d45e41641 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2c9ff61f3909989dbeb55e35703310a472f9f29e | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/37991b2d1ac71ce282b480314c519117dada4211 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/422bfd56c37cda20c3b0f87c1980aafa852f07df | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/381724cba3553b2aaae43a8fcedead224eedd798 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/060e7d5d27acbc84004a3c598d22faed686f3642 | ORPH
powerpc64le  | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/fb4ab718ac4e40d58d7d9421ccfeee4a6b0f93a6 |     
    i686     |      host-qt6base-6.11.2       | NOK | https://autobuild.buildroot.org/results/885e0fe58f9a9f14e6ffc04ea7d029e100844ada |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/27762d852f9c6508ae1f1d116af5669751880ffa |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/f074b5d007ba6f7ecd7ac715a44899da3bb67e99 |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/9832821cc5eafafa19b6c008fc268f5d13455076 |     
powerpc64le  |          i2pd-2.61.0           | NOK | https://autobuild.buildroot.org/results/a340eecc9c722e7c666b352f8e6e6a2ff89325cd |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/6ef2855925b85574be6d07118c5d5f7ee25a6b90 |     
powerpc64le  | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/926238f5f954c7120a410ecfaabf194751cd57af |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2a08766da661bbb7e65cc74985de463453653690 |     
    i586     |        iniparser-4.3.2         | NOK | https://autobuild.buildroot.org/results/a695c9da3141609d205b3842433bee47e1e3eb5c |     
  aarch64    |          iperf3-3.22           | NOK | https://autobuild.buildroot.org/results/040df6c73868f59d347a9df920a374096f9d53c8 | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/6db714796454cf5bf1d2d0b358770482d7e8387b | ORPH
  riscv64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/fc62cd0cf3c51388faf93bfb9315d13c7cbf3779 | ORPH
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/c5090223f5650dccc47731d8eb8fae5dbe21069c |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/9a1730d9d6b20e631d389349da2da2d34590f35c |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/ef8e39994bda11c6802ec2c7ad40a811a94ef56d |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/23c947e32faa15ef4688f06b02afb8e6dfe8c1d4 |     
  riscv64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/317d29c621e82deb3cabff8d331ee6dced8a236e |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/cce3c61bf58540e7c221ba4b0027a075fb2ea338 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/9d5c4657d5e2634aff677cc7bf33b09f2f6d7335 |     
  riscv64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/fedd07e18c53a66094918be673769007eb06e64d |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/72bb4adf0f71ef2f9ce5fc8aec61236cfc8fc925 |     
    i686     |        libglib2-2.88.3         | NOK | https://autobuild.buildroot.org/results/bd875fe0511320f9410f70dc3b9d2dbf035eddbd |     
    i686     |         libmdbx-0.13.6         | NOK | https://autobuild.buildroot.org/results/ceb8a0aed78a01fc42758c6ffe6793eabfeac7eb |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e42a17a768d84f6f9a233b967e9a78702acec584 |     
 powerpc64   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/1c522337a1f22f168f54b048d5463b488cae6312 |     
  riscv32    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/24efdd496543af579034a12cc9dd432fac6f19fb |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d075edb16454732059f43dfb38cf7eab412b5999 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a1c5d7a2b02b7fe9e71e11ffc97777af7204420a |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/68ae11ccbd978207f277ecc41f1ea128ca30fde9 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c55248495e0e1c5c8446d237b890d3696c9b0db9 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4cbfda2d235f5506bf650d1db7b31df6d1afb6ff |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/932cd6696c7bbd552d6a0215a0422fe0f274073a |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/20d92f8ff7eefd42a71294c2485fa2d8f5d5f63f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/e357c42831a9e4341f5720f5eb8014d2c5bc018e |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8e135e4b2fbd8ee814cd5727c75c23e61664acb6 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/0cee0348ac4ed9b701950cb4e053615c11c51af8 |     
  riscv64    |        libopenssl-3.6.5        | NOK | https://autobuild.buildroot.org/results/f2534cd813fe73601b9f727858f823c6f6a274bf |     
  riscv64    |        libopenssl-3.6.5        | NOK | https://autobuild.buildroot.org/results/da7b8f0c63e30a1076192fb8886e15602173d1c7 |     
    i686     |        libtalloc-2.4.4         | NOK | https://autobuild.buildroot.org/results/c85afe1a53f2b71bdff4c6205a83a464001760a1 |     
    i686     |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/8ecf0d4cf6bba9417f7f895519107836843689c0 | ORPH
  aarch64    |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/cfbb68c484e0fddf3cb1fee81bcbe2ad48342b6c |     
  sparc64    |         libvips-8.18.0         | NOK | https://autobuild.buildroot.org/results/0f173f64461d281d8382ce4a60e1519b77319a28 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/e6f97bb7a76fd115014576d8e4946752ec34ef0f | ORPH
powerpc64le  |         linux-5.10.271         | NOK | https://autobuild.buildroot.org/results/1adaa145f360b79d8ed1dd19ac99690fcf293f4c | ORPH
    i686     |         linux-6.18.56          | NOK | https://autobuild.buildroot.org/results/56b84cf421a8a1c689bb20fa76e9eb5604c94afe | ORPH
    i686     |     linux-headers-6.6.158      | NOK | https://autobuild.buildroot.org/results/f381483cbe1c455b63302a47eb98d7e90743453f | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/297bd16a35f81e12e3b508aceb3444d6c75bd03c | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/afb2ff312fd5b943fb3dbc66e114e43bf820e0ba | ORPH
    i686     |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/fdbad9faa2fe67a7f25f3ba7e9dd26c09dfbbbe7 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/b4b8bb46d635f6caa6e1b974b3739da3907e4998 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/d3690a17660640de1e985bf4ad37758037ad58ff |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/3c27d53685ae351b558705627b24dc3a41ea7fec |     
powerpc64le  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/8d0090a85e16b9932fff8ba2a26c7f016d2d8841 |     
  riscv64    |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/76fc83a18d7998ba2eab67f6358638d8e9264210 |     
    i586     |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/34a699259fc679be5b50236aedd298e4058377cd |     
    i686     |          ncftp-3.3.0           | NOK | https://autobuild.buildroot.org/results/dc5464e6e2564548a6055ec6f98d47a6c0fc2466 |     
    arm      |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/07e2af2511ec261dbc179122ba123c3b224944fe | ORPH
    i686     |     network-manager-1.58.1     | NOK | https://autobuild.buildroot.org/results/1b7a8b60f941c58174785996be41446705d557d3 | ORPH
    i686     |            nnn-5.1             | NOK | https://autobuild.buildroot.org/results/2d6a51b0d388e7a5f85dcd28c3d7edb6f415c3d6 |     
    i686     |        ntfs-3g-2026.7.7        | NOK | https://autobuild.buildroot.org/results/fce5ff292f403dec668bc6d56690e66b874860a9 | ORPH
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/cc499160a891b59ddf911afe0329348e8ba8505a | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/4c712e25e5a91c239999dc85a368b953876a3e31 |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/1d63276a8621ab574093cb4bcf9ee72a43b2569d |     
    i686     | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/5d3a59bd1c637cd7e07361a82f63ce11863840b0 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0fca5755e13e73d4038957f696803ae73212fafa |     
powerpc64le  |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/a28883f234e8cb60da81ef39e739938e5a4a5cc4 |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/05529160f9870defb1b93df0140665a61336bd50 | ORPH
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/886b93fe65be50d7bdd8a4015bc9331f0b6749ee |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/ee70307912d6a2b515662f2c7636921a287f8c11 |     
  riscv64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/35c07f279309978934637c2faeb581762a06ecb2 |     
    i686     |     python-serialx-1.11.0      | NOK | https://autobuild.buildroot.org/results/4590cacbe399c379f7e10bfb03a5ea0b391f235b |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/2780638ed73b9811f3f1a38e27fdf6b083d5698b |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/503475e2dd1b3b129fb5f994db39c15412710f2a |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/3bbdefebf1572543ee17b4bb062729cd6beaf570 |     
    i686     |       qpid-proton-0.40.0       | NOK | https://autobuild.buildroot.org/results/f9feb17ef2eba5a1914360cb5b264176ad8ae1de |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/3c5ee5553a980f929a2cf2bf048d96aaa1a25880 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/11fc89bcfb07b4fa2c6c1ee19bc5ed90a1726662 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/5b36c5842056840bfa99d3232d0f2fb3814c1e05 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/a2ff88e2bf78f5d54356001c8adaf46941ea36ae |     
    i686     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/620c3e8861d41bb35f5c19b8412c66385d52ec47 | ORPH
  riscv64    |          rsync-3.5.1           | NOK | https://autobuild.buildroot.org/results/d4a77194cf4cb11971001bb1979f0465b95cca78 |     
    i686     |            rtai-5.3            | NOK | https://autobuild.buildroot.org/results/018a1c85b4b32d00538716b7875f184845e8c539 | ORPH
    arm      | rtl8189es-0a5d04114fac3c9f4... | NOK | https://autobuild.buildroot.org/results/7725d23d856b91550caceef60306b8346933ba41 |     
    mips     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/431211bcbd920f6a2b60a45f67ceab814509daa9 |     
   xtensa    |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/64674dc4cc2ec467c629f14a830007355e2fe16d | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/e5b9016d169a17c5822737d09fbaea19322b5898 | ORPH
    i686     |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/955c34024586890ed2ec6c305e71ecb36618c399 | ORPH
   x86_64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/c54d8f12382d438cdc2bbb2e7a0e551a204f544f |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/ed2f7c57c167fa13f9a146fada48eee85b26ac4b |     
    hppa     |        soapy-sdr-0.8.1         | NOK | https://autobuild.buildroot.org/results/979f71524db74b7dedc451bf867e08e8f762057d | ORPH
   sh4aeb    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/672afff44552244648bddb78f354a557685f6b42 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1ad2ed2979b2a406cfb4c88839bcf6262adc985f |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/915599958d92cf927857485173f066affb49277c |     
   x86_64    |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/96c9aa6e3129665974af175001b6def13d51eac0 | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8e1cd06cc14de13dec2f167500f41f9a99fb1014 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/fd1a731e0794358ef9fae6e36b95ed0fc372ec64 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/57c69e0750f5592b232a3f06993fcf01c73edb8b |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/9bad26dc8dacb4b56934af58c93a024b08614d6f |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/9a617ad9f149c6639e62457a4d4302b8e0db8e9f |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/6dbbcd5c7891e8f97d36a09b9400770bba38831b |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/fc98454adacd7b116b6f3047d48a91a3062d0835 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8e134b30563761e2432b954d03867a9fcc34db17 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/578fab6583df3159b5a481f04df35a71d607f3f8 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2ac1ff717f02e49ca8e854c468a67c54ac791555 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1cc5de759e60e2e758c4b9fd76bc62a88d14208c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/84fe9b61349cafc85f15f370181f7627147977c9 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/ea28cc45ebe9a63a436b8785fafddc821304b018 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5c6ecf79daacb82f031b62ca323305aca5f3810c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d639260e0785f9142e3167aafbd4847881d9f11b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/1782bec924daf519a579876097b983b4a99600e7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d06ce74735f3b928d611f7d7482ba9e3f840152b |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/79de37d1ac8ce5e04929cd85f0eab6bc44888164 | ORPH
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/f64958dd68c9906f7243664457aa248dac772ad1 | ORPH
  aarch64    | vexpress-firmware-901f81977... | NOK | https://autobuild.buildroot.org/results/3565d3447c9bbda76a22ebf71670e608160bb8d3 | ORPH
  mips64el   |           which-2.23           | NOK | https://autobuild.buildroot.org/results/3ac192421b8414223292756b38ceb240d8fb9a57 | ORPH
    arm      |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/7afcaa226d1e7e3ae67ece48365df429ccb19196 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/3223015cba549936f62dac29b3c63f78d08c99ef |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/3a00b5c5619df74774d471af41560c42464ab543 |     
    i686     |      xdata_xbitmaps-1.1.3      | NOK | https://autobuild.buildroot.org/results/da3e65a422117bfa002072cbc40d98b170e2368d | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/af7557c7b9769ba70d981414ad6078a718f883e8 |     
    i686     |           znc-1.10.3           | NOK | https://autobuild.buildroot.org/results/854bf704b1381ced192b27ec6337a7bbec0a5f3b |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                      gdb-16.3 | 1 
            host-go-src-1.26.6 | 1 
            igd2-for-linux-2.2 | 1 
                  pdmenu-1.3.6 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |            gdb-16.3            | NOK | https://autobuild.buildroot.org/results/1f3c2c1ad4ad895f4fb51335da29140455fb0201 | ORPH
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/ffaed5be64c799461aea68f4f70cb2ce4dc78a73 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/16b46dbf73563fc1d5ca12754dd7b34435af45a8 |     
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/51969eacb7a65bd8c870d565bc1222df87787253 |     
   x86_64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/7fe9d7d2492b9652efd5297f5554d9b0817b86c0 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
           gumbo-parser-0.13.2 | 1 
      libabseil-cpp-20260107.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/c5c3beeb61f702546923ec3e94c7025a479a1f34 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/7d1f2353e49ae50a99d3410bc600dc6b126d6e1b |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/252602a7d6d2bcb15e2d77878d2f7dd2d9802a37 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c74f75386f3c8b75192a42d3586ee197ef2e7bb4 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/5b7e98f488722b412aedcb7b0c556773daf5a7f4 |     
  mips64el   | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/31167dc6bfa0e849f086a551d92e661a9179cb6d | ORPH
  riscv64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c628b1d5914addbaac36965dcd274be178c57cf2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/26f25f4458f6b798d69c41d4a4579fd13e349574 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                 fwupd-efi-1.7 | 2 
                 logsurfer-1.8 | 2 
            lttng-tools-2.13.8 | 2 
                  boinc-7.20.2 | 1 
              e2fsprogs-1.47.2 | 1 
                 fwts-25.03.00 | 1 
host-netsurf-buildsystem-75... | 1 
 host-softether-4.30-9700-beta | 1 
                 inadyn-2.12.0 | 1 
kismet-52bcb902e36b2df1562c... | 1 
              libmodbus-3.1.11 | 1 
              libopenssl-3.5.9 | 1 
     libphidget-2.1.9.20190409 | 1 
                 libpng-1.6.59 | 1 
                  linuxptp-4.4 | 1 
                memtest86-7.20 | 1 
                  ndisc6-1.0.7 | 1 
package/linux-headers/linux... | 1 
                pipewire-1.2.8 | 1 
                systemd-256.17 | 1 
                       unknown | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/2c1c560b28ddaaf1ffdcddd1867a3f6ee39ff06f |     
    arm      |        e2fsprogs-1.47.2        | NOK | https://autobuild.buildroot.org/results/af0e2aeae619c73991ae11d84c8b0e0b90ad6e08 | ORPH
    i686     |         fwts-25.03.00          | NOK | https://autobuild.buildroot.org/results/e554de694f3c4fc2f560739b25755f582197ab5d | ORPH
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/a09879fff366d49e1ebf36f2356ea70b7e184387 |     
    i686     |         fwupd-efi-1.7          | NOK | https://autobuild.buildroot.org/results/92da91d255a9acd495b5f97c25287f2823c3a20d |     
    i586     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/ba96a893aa110d47f407fecfe68d5051de34d618 | ORPH
  riscv64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7202a531bb6ab5dff5795edf61c308235d8f7c12 |     
    i686     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/bb30d14ffbe639245ed9950708c6ce9d09357aa8 |     
  mips64el   | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/3616228ae0a29a7b5c91ed39e6877636c5799b5f | ORPH
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/1f1f362b1f2c0e81da6f8099291b64e6d938d1af |     
  riscv64    |        libopenssl-3.5.9        | NOK | https://autobuild.buildroot.org/results/8092631b849fce7dfedca8928d5453320f94a362 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/2f7dfdb1d4d958162f956b9170637ab085a22e3e |     
  riscv64    |         libpng-1.6.59          | NOK | https://autobuild.buildroot.org/results/c3728e0e4ca006fcd8b125c47ff80adf2541deae |     
    i686     |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/43413477be41cab2f0075c63fe78de73edb3e660 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/fee570c3d0fc003e40e00f2917a5422e4a1a7165 |     
    i686     |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/0e9abfa6146a24d2829f22f3e0911ba0733398c1 |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/ba40e1d4dda3219607974af389e9e97f5e32e603 |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/e710e624ccb2972bd64aef470ef3b2753f097d9d |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/c55b39b1986aef0fa20af9094626bf06b5c20b61 |     
   arceb     |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/d391805c125e0bdd60e364d17f248fb501462913 | ORPH
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e2c44c07aabef5540d42c74db831a1bea9c72b63 |     
  mips64el   |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/e48af13ed67dce04b1f5df28456b035108f2f5f4 |     
  aarch64    |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/78e51ce699fe57444bf6f748355547a856e8fd4b |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ccf67c0965ea814256dd0a92b5378dbdf8ba3880 |     
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/fc453149e74ee008c1e6399564b69c8306f4b558 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
