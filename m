Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57554C61DD6
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 13:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB16240BC8;
	Fri,  4 Sep 2026 13:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWIAlLJopfdW; Fri,  4 Sep 2026 13:41:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC2DD40B48
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788529308;
	b=rdE5aSnx7ao7DAO25WEij4tTKL8rYVOsaL4ZqGCtoecEBZwiSgVUX+E8VwZDFLJsm3RI
	 JMD2JZwqlujuaW+kkPgXpyJm6gJm5mnBk32mK0HyTSTg/NnX+1cHwj9O4HtD/jJlQnfSZ
	 3oEP7VBJGo+V9o/tmsc1pTP/VN7mjAD7QM6Abe8yQVe0t2IvaHulqAxcYNsRdfFMZ7B/K
	 RgJ0PFgogVtK30+QarcZYLyTVWtYbw1tIEQ0HJtW5X9u6gdwdix2gxtrt8QjvdUjxWmpt
	 uUjpCT76WVnTLoNaTGw5gyWD2bP8VBtTrtVTQWW08C8Vv4qAglCrtrYQQntUWrDTjhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788529308;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0ypbbzinwcB5xrnTgKeyr13K2h9pR7/WIZXvEQqLEmg=;
	b=XQt43Dpymg6gyXHMfBlrnX9X732GKmLVkug0MILr4uvNWcFz6CyD2l7RFD0H+Khhu7V0
	 w9Kmo+j8Y0CBFR8qXeXsmaABTg7uzbFxJ2TyfF8huEE1vwiNVD3WPSG1MI06WIKfkB/HE
	 7ktN1LpDFZLo7Oenso+wYScSoo1ky6BVcRIVLDqBc5mCc3KCZEbJqrHwsxYrnTQxPWlrH
	 gBKZMJ5He4EA+N9hkqe/A8A3U4L/xSGKygUK+whJqeBXTO78ikz/825WPwkO7bq+seliR
	 L7pCrZD0AU8fERPS1S2iKNDVy0Z4ALb2wWJ+54bsGs5bfrYb5T2kk6NT210H6TxUE6A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788529308;
	bh=0ypbbzinwcB5xrnTgKeyr13K2h9pR7/WIZXvEQqLEmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AHPSmxzjSjFQjLpQxyt+qORDbc7t1zS/VlXnZ3UX8QfoUBBjLD/SYWdTIQC99w+kj
	 yeKH8XWf6UXR+XF7EwZjOoVh08pH/w+WXl4kAuedPe8lEz2yqrd7aqmqKW6NX6zTIS
	 CgmTenbcGrsHkHE5BdI++s8vMvekhntoimL6Tsnb97uopwXJ6p/q2kIKOV1zU/w2WI
	 1pwT7dYJ8YbSDrYPTzEsTvMotkSt94fD1Rrb90IepOeN3q3/vOP933n0nv8Lalyq7g
	 26+jgNVkI/XlStkiR/GbYJJ+sGn5Pyy7sLrViJMXt0nSojd/Wil/m/fYYxJ0twDqlC
	 WAqG/XljkL7yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2DD40B48;
	Fri,  4 Sep 2026 13:41:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46F9377F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4433D60BBE
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nz8kUgN1_5MH for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 13:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D594460BBD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788529306;
 b=cQC8j8pu1lfGQDnNkF775XAh50sYobHWYJh/Y9wN01xsuoTrHWWZJAb0JvZOqTGBCNMU
 jgSaAnEmyZhFtb45vgX/XBy07OZD3SS0y4leRFrYP98jpvWFQoQNpTVLIpeBTiE1zfitW
 QPR5s5V1UHQQ1oaQMFbRn+/2k/N6cwi8RmISYwziDttg6JjSBh/Q4WI6IHQdz5ehbKs/1
 JnOPAdUxXMm5zcP4lufSu0PdhXAUTkWZDsJ9xLECt6HvwDzLpPuVhtWP7WpIC6KrpyeBt
 qzTs2EsH4C7l35Lk0mO6jHHK16GMD/J0/gdD4kyr83WbYVFPiTihXZV+Ng+80jEmEpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788529306;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XHSSNpAWm/HhL4N1Abx36POs8TCQx5UKf9RDmYGLq/I=;
 b=Ok9lV2QQnUWTC3WPoUUPsgecSrGtQGLY05sgt1oGRKMBEY0ZTL2dx/cA6sxS44VEt951
 70GNkNJm7AItY/gwdd26Lg6f6C9RN9TqxFqn37I79QZ3aG/YIkvWr0H5NE8mSANTIlbEx
 FG4dcyo/2M/n46EJKE/T1B+aVrmJP3Og4H/vgR75xcE+As1uburMVYjWC6QvdT8BdZdWa
 2NS+Hekak47S+cW7SUGsOQ52lnPXjlWlOIbIETswieogNEmwstMRnNW7Y8Mq45VkPEtkC
 opjy1CeO/OpbqfFfV1H7cOOGNHc3xwhY+80R3bS0JcWsaONeyMSlz7ip8S3Tviqbepw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HX2Y0HRg; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D594460BBD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 13:41:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-482e257a23aso720198f8f.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 06:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788529302; x=1789134102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=XHSSNpAWm/HhL4N1Abx36POs8TCQx5UKf9RDmYGLq/I=;
 b=FVYKqzB72dX6bGlq1mU+PCY+QRw6yueOC5Wqaz3DYGUXCmb/jp5tFO8ZAAxiPCszsz
 13DhUECShTTFkgyCa7e+YPszBp3idehOkz9Fy/ROs5t33GxQe20VShj+2yXwXOauVK5Y
 Ro5TIZBCNGB87rea95g0PJoG9JjUj1bCtAsAcsySgdp47q6UhgPHHBmzwB6vI+TI1IWn
 9w9vSwlLGxaC0rbQPvZvS+x5zFw78YpjbGW54xfxCzY0lCFWVDfoYqkmGAK9JQUg+jug
 0M6z20HBUEoOnWmEQRRtzEv8x9AbUqEls9nLoCjNav2yTYyaIAuw4/VVoNpOK6w/1+QB
 0Pug==
X-Gm-Message-State: AFuF++niWecUekUXBG7PYCpoY0nmkaAPdAIRTwZn1oxKPDtJiXE8TFvt
 7w/BlQOEVqbey+9b4Sx8SjEgm+T89X/7QTrESHCG5vCTRTNNvCBPuM4sMC8MaupG8ZoFPdmNCBy
 qHvAM
X-Gm-Gg: AYBFou07fcFpFxlRPIShNFGvc3ebBLd9p7DOjiXk1wT6clrlX+ujy8Vufo7gmP9v/gu
 KPboAj6slCtKche3fYJPeVxnC0YNDTaCsEgKnbnubPurPOZOMB3BnBioFCiH/pRbHU/SxeifJGo
 TaZ/2UbV6Q5LABQMkBuYezsUJznyqmWNWPt8zFsmzi9qmFrwxHfzl9fSu1saq1XkKQ5SROV7B2I
 SilFmkwT5Cm3MVia4K8JCFMVy/oKM9nbuqHMgQfbg40cUQFtyvQYZnVDJAqU7NFNwYog4gSDDiN
 OG25hfr0+emcc/Ul/K4md5kUzdl5n1KJ+wNQ6Nzw1sAdo0VarvbmEV4cwydoWxjBgCNkpX1WZ6D
 6OaZPtbUe0c9PZ1q5qmY7vapOJlHt5+MAugehNlUIcE2t+zojmkaY0ZXo2QvYyFR6rbs/72IBfe
 23zQjUwTPzufYjRk0TRGb3rkQTEa0rs8QsGMfXjO2+4tQ3ZOA8IQKJ4w==
X-Received: by 2002:a05:600c:314f:b0:49c:ffde:45ff with SMTP id
 5b1f17b1804b1-49cffde4629mr2037055e9.17.1788529301917; 
 Fri, 04 Sep 2026 06:41:41 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485881353e8sm6658261f8f.1.2026.09.04.06.41.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 06:41:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 15:41:40 +0200
Message-ID: <20260904134140.479400-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] docs/website: add Othermo as a silver sponsor
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Othermo offers manufacturer-independent operational monitoring for
energy centers and boiler rooms. They connect a wide range of peripheral
such as meters, pumps or pressure maintenance [1][2].

Thank you for sponsoring LTS maintenance !

[1] https://othermo.de/
[2] https://www.linkedin.com/company/othermo-gmbh/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/othermo-logo.png | Bin 0 -> 5492 bytes
 docs/website/sponsors.html           |  14 ++++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 docs/website/images/othermo-logo.png

diff --git a/docs/website/images/othermo-logo.png b/docs/website/images/othermo-logo.png
new file mode 100644
index 0000000000000000000000000000000000000000..98f8a93f387495fa0aea8b1285110669ab44e51d
GIT binary patch
literal 5492
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

literal 0
HcmV?d00001

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 8353b149e6..1facb3c2d9 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -68,6 +68,20 @@
             </div>
           </div>
         </div>
+        <div class="sponsor-entry">
+          <div class="panel panel-default panel-lts-sponsor">
+            <div class="panel-body">
+              <div class="sponsor-title">
+                <a href="https://othermo.de/">
+                  <img class="img-responsive center-block" style="width: 100%;" src="images/othermo-logo.png"/>
+                </a>
+              </div>
+              <div class="sponsor-body">
+                <a href="https://othermo.de">Othermo</a>
+              </div>
+            </div>
+          </div>
+        </div>
       </div>
     </div>
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
