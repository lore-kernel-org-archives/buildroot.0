Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E63C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CF46F4EA;
	Thu,  2 Dec 2021 20:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIEiFdZqlTV9; Thu,  2 Dec 2021 20:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B17F76F4DE;
	Thu,  2 Dec 2021 20:58:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 552E81BF3A7
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 436A56F4E3
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 20:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BWYFpV1Fp-Q2 for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 20:58:21 +0000 (UTC)
X-Greylist: delayed 00:26:04 by SQLgrey-1.8.0
Received: from fallback23.mail.ru (fallback23.m.smailru.net [94.100.187.222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F98E6F4DE
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BgSBftvSxzcMSLdHLodpLLNwTlbi8GroTpzqsKzD/AI=; 
 t=1638478701;x=1639084101; 
 b=O0LU0TmoXf+6xM5k10MeDUsSK6WjknuoBeDPPQ2Wi9fXDS/eX9QSHpXqy9yBmuWjh4s1PsLEru9IAKHbuImFiudei6h7lCGkFar6UWc9Se+HCCd/mHKVwY/uYxWvceeToIrNXJZ38nLD1mGl/dY4Zmkl1zJ72Ajj57LUSfA3bTM=;
Received: from [10.161.55.49] (port=55468 helo=smtpng1.i.mail.ru)
 by fallback23.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1msskY-0005GC-N7
 for buildroot@buildroot.org; Thu, 02 Dec 2021 23:32:14 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BgSBftvSxzcMSLdHLodpLLNwTlbi8GroTpzqsKzD/AI=; 
 t=1638477134;x=1639082534; 
 b=Y4SYfuiKlgo7TSStzBTHenN3aZdmxSIs/WDC1VLJ3QU7TK/8FrpoSQBqwaBAV7+gNw67MfmPNgANUHM/xiZ6M6JpwQip0L74bty/esbmdiQHpZov8UnVuZZFpkGf8h+2kuRKAqPpaa28ExUfFIkQu23EKgS6p4hbcdPA+N5kdYm33RUQCcj7eFK8PjlV762bD/vL7pK9VJMU1tz+Y1JdNBvl6C7ga4y6UMBHayWrIg4+npI/i2lrfzUQxmEV/UZxyconO4/5eQIL1oGBA9mlw5YIE6/y39bukUSt2mCtwNf+TsXp0GhKm3oGMsIHb7n8wGDVyuJfZURGpa9wMDwsSg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1msskN-0003Bj-T1; Thu, 02 Dec 2021 23:32:04 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 23:31:52 +0300
Message-Id: <20211202203154.3571442-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD93822B471089FF64DFA455658C3104DE9BDD9AB7435BCB66C182A05F538085040CF653E21A5AD0ABC49B81CA43272695055155E4BA66D969A39A509EF4B1941DC
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7353CFE866E745C13EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637188F5654332B449D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81A84555253433474B523C50DBAD6A8F66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7F1FF917D59728F209FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F28451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B05EF1B56D39DD5F7389733CBF5DBD5E9B5C8C57E37DE458B9E9CE733340B9D5F3BBE47FD9DD3FB595F5C1EE8F4F765FC72CEEB2601E22B093A03B725D353964B0B7D0EA88DDEDAC722CA9DD8327EE4930A3850AC1BE2E73542F54486E6D6388DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9D8F3D8DE879ACA27C0157D52F58C1CBA39C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359A3485EE9140A7D39D1F9270390973918F93EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3473688ED311681BF0AF534E4B63A549B65B52E594AAA2EBDD369E8EDE3129106BFB1841DD7F1B68661D7E09C32AA3244C8F62BDB4B1CD09AA635FE29BE9020E7633C9DC155518937F729B2BEF169E0186
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR1zfegNgD+AfQ==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DA2B38174FC28AA41C206627A2394C80B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 6242723A09DB00B4297D9AD4AAE60BCB73DCF6C1D8861912BDEBE06922097816049FFFDB7839CE9E5E34638419BF5A19EB1B18061AAB12C10B185C5A47C26702A942CEBAED9A6FB5
X-7FA49CB5: 0D63561A33F958A5ED99BC446B3CC1912B98F192629B9E34221D666B6DBB12C8CACD7DF95DA8FC8BD5E8D9A59859A8B6668B94F0A65C3A0CCC7F00164DA146DAFE8445B8C89999728AA50765F79006372D0AD69218B09DB0389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80072D29C69FDE18FF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA775ECD9A6C639B01B78DA827A17800CE7F45C1E71A9DFFA2A731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CBD1FC2C1415E7E9D0349DE68E05B9EDCD6F76A47F6E8F5F29C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A4DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMMFVqzO9sR1BNIiT+Warzw==
X-Mailru-MI: 400800
X-Mailru-Sender: A5480F10D64C900538CFDDA562D7B4DA56E776DED79E6278668084DD083497ADC9FCF9F41D102367C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CC77752E0C033A69E3453F38A29522196
X-Mras: Ok
Subject: [Buildroot] [PATCH/next 0/2] add threads dependency to libgeos
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxim Kochetkov (2):
  package/libgeos: add threads dependency
  package/postgis: adjust libgeos dependency coments

 package/libgeos/Config.in | 4 +++-
 package/postgis/Config.in | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
