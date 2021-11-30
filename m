Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 13:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E69381010;
	Tue, 30 Nov 2021 13:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wKx2fLRlwfl; Tue, 30 Nov 2021 13:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA8E81751;
	Tue, 30 Nov 2021 13:16:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB97F1BF2AF
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 13:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA23C6063E
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 13:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTYiKo6nVw5B for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 13:16:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4865760706
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 13:16:20 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y12so86574860eda.12
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 05:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OvW5eCo3WPbEH9UhdbKdPY+cpHpdzHmMwzK76+w5loU=;
 b=D58ayGLZHaD1GiqOYyq2jjHcINGJzVDBkN8wozwGwGQEhY9l3HCAbYA/xxRVGjie7A
 wOk0jvknD9sYLm+2q4CqLtgCFjdBf8S4CKOr8t1Tko6P9tY+1BjlmHQlTIgzk//VjDDu
 8TfwYm8V7HhLtWPLFMMdbUpqZeL2ayQMOnrG67sCFheVz9Ctr94dApTtRek0nWxq97u0
 Vi11IJ9htTIzuri8T/SgrnqS+raAYpEsc+Ga2Xqg+RFh+V3pyYs5Miwak1Bblg9Qbjyx
 ix6DtVkXPh102stkF3otHs4GDiihjOxFbb20pVxN9kNAXYrA84D9O1HZgrz+Zhton67s
 E6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OvW5eCo3WPbEH9UhdbKdPY+cpHpdzHmMwzK76+w5loU=;
 b=M09/Ee41eO8quQFKxW6ScJ9wVw60f29Y2baDdadd1o0HUV7KT95tp0ijQlR8MmB+LN
 HdeZ/xTLB1huq+KAfbcet3t43DYiTL20ie37Gbuh/k6qKLUB7NhdF3rYhQMIn2E1Ur/3
 RbYYn7H+4Vl8En5B4jcD90bC6+SBtCdgyf6j4loKIVMpQH3KybQtXl2mJfoenCueVZfY
 A2SLIsIbdWTOlVecZZ5AMig5rWBZ+ojvnJQGMpOuNPH9nChWV4QHuIvkZ2myEM/NS0eu
 Jni2WLbtCrPTSyER1RGQX51u4cbL3hx3JSRc6OnGn7uyomdZUYUPVeBnkuWpqer5bYQg
 Mx7w==
X-Gm-Message-State: AOAM533ktEDLY1bzMzrIQWyGVyqd/zsuaWuO/QWNsk+cfFiK3v4Com4r
 bOG/0O+szlPxPWO/z/6anYm//XQ1jcwCld1q9LlLvRnkzdtT0g==
X-Google-Smtp-Source: ABdhPJzRZMzNxORBG1v9lUktPwBmCVo8ek6vdU5aJZpzHWW/uKfZFo8veUph61EnQrhOKZWDAuZ3RuBlD49GC8anrwM=
X-Received: by 2002:a17:907:2627:: with SMTP id
 aq7mr66084040ejc.483.1638278178275; 
 Tue, 30 Nov 2021 05:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20211125072240.2932-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20211125072240.2932-1-jose.pekkarinen@unikie.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 30 Nov 2021 15:16:06 +0200
Message-ID: <CAJPV9MrPgQ3Q2JVLqy8_93pijeJRyZzPFqRpB3817fh3asBzBQ@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH v3] package/opensc: new package
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
Content-Type: multipart/mixed; boundary="===============2767034920397090765=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2767034920397090765==
Content-Type: multipart/alternative; boundary="000000000000dc23ab05d2015c5f"

--000000000000dc23ab05d2015c5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Any comments in this patch?

Thanks!

Jos=C3=A9.


On Thu, Nov 25, 2021 at 9:23 AM Jos=C3=A9 Pekkarinen <jose.pekkarinen@uniki=
e.com>
wrote:

> The patch will add a basic opensc package to build
> on buildroot.
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> ---
> [v1 -> v2] Addressed multiple comments from former rev
> [v2 -> v3] Fixed warning of missing signed off patch
>
>  DEVELOPERS                                    |   1 +
>  package/Config.in                             |   1 +
>  ...ckage-opensc-fix-maybe-uninitialized.patch |  69 +++++++++
>  ...x-strict-aliasing-warnings-as-errors.patch | 132 ++++++++++++++++++
>  package/opensc/Config.in                      |  11 ++
>  package/opensc/opensc.hash                    |   5 +
>  package/opensc/opensc.mk                      |  14 ++
>  7 files changed, 233 insertions(+)
>  create mode 100644
> package/opensc/0001-package-opensc-fix-maybe-uninitialized.patch
>  create mode 100644
> package/opensc/0002-package-opensc-fix-strict-aliasing-warnings-as-errors=
.patch
>  create mode 100644 package/opensc/Config.in
>  create mode 100644 package/opensc/opensc.hash
>  create mode 100644 package/opensc/opensc.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 70262eac8c..d92c38f07d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1455,6 +1455,7 @@ F:        support/testing/tests/package/test_zfs.py
>
>  N:     Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>  F:     package/softhsm2/
> +F:     package/opensc/
>
>  N:     Joseph Kogut <joseph.kogut@gmail.com>
>  F:     package/at-spi2-atk/
> diff --git a/package/Config.in b/package/Config.in
> index e355ab1987..3cfcf372f3 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1617,6 +1617,7 @@ menu "Hardware handling"
>         source "package/tslib/Config.in"
>         source "package/uhd/Config.in"
>         source "package/urg/Config.in"
> +       source "package/opensc/Config.in"
>  endmenu
>
>  menu "Javascript"
> diff --git
> a/package/opensc/0001-package-opensc-fix-maybe-uninitialized.patch
> b/package/opensc/0001-package-opensc-fix-maybe-uninitialized.patch
> new file mode 100644
> index 0000000000..1f6a2e6f42
> --- /dev/null
> +++ b/package/opensc/0001-package-opensc-fix-maybe-uninitialized.patch
> @@ -0,0 +1,69 @@
> +package:opensc: Fix maybe uninitialized issues
> +
> +This patch will fix some warning treated as errors
> +that highlight maybe uninitialized variables.
> +
> +Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> +Index: opensc-0.22.0/src/pkcs15init/pkcs15-asepcos.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opensc-0.22.0.orig/src/pkcs15init/pkcs15-asepcos.c
> ++++ opensc-0.22.0/src/pkcs15init/pkcs15-asepcos.c
> +@@ -221,7 +221,7 @@ static int asepcos_do_store_pin(sc_profi
> + {
> +       sc_file_t *nfile =3D NULL;
> +       u8  buf[64], sbuf[64], *p =3D buf, *q =3D sbuf;
> +-      int r, akn;
> ++      int r, akn =3D 0;
> +
> +       if (auth_info->auth_type !=3D SC_PKCS15_PIN_AUTH_TYPE_PIN)
> +               return SC_ERROR_OBJECT_NOT_VALID;
> +Index: opensc-0.22.0/src/libopensc/pkcs15-coolkey.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opensc-0.22.0.orig/src/libopensc/pkcs15-coolkey.c
> ++++ opensc-0.22.0/src/libopensc/pkcs15-coolkey.c
> +@@ -147,9 +147,9 @@ coolkey_find_matching_cert(sc_card_t *ca
> + static int
> + coolkey_get_attribute_ulong(sc_card_t *card, sc_cardctl_coolkey_object_=
t
> *obj, CK_ATTRIBUTE_TYPE type, CK_ULONG *value)
> + {
> +-      const u8 *val;
> +-      size_t val_len;
> +-      u8 data_type;
> ++      const u8 *val =3D malloc(sizeof(u8));
> ++      size_t val_len =3D 0;
> ++      u8 data_type =3D 0;
> +       int r;
> +
> +       r  =3D coolkey_get_attribute(card, obj, type, &val, &val_len,
> &data_type);
> +@@ -168,8 +168,8 @@ static int
> + coolkey_get_attribute_boolean(sc_card_t *card,
> sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE attr_type)
> + {
> +       int r;
> +-      const u8 *val;
> +-      size_t val_len;
> ++      const u8 *val =3D malloc(sizeof(u8));
> ++      size_t val_len =3D 0;
> +
> +       r =3D coolkey_get_attribute(card, obj, attr_type, &val, &val_len,
> NULL);
> +       if (r < 0) {
> +@@ -186,7 +186,7 @@ static int
> + coolkey_get_attribute_bytes(sc_card_t *card, sc_cardctl_coolkey_object_=
t
> *obj, CK_ATTRIBUTE_TYPE type, u8 *data, size_t *data_len, size_t
> max_data_len)
> + {
> +       const u8 *val;
> +-      size_t val_len;
> ++      size_t val_len =3D 0;
> +       int r;
> +
> +       r =3D coolkey_get_attribute(card, obj, type, &val, &val_len, NULL=
);
> +Index: opensc-0.22.0/src/tools/opensc-explorer.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opensc-0.22.0.orig/src/tools/opensc-explorer.c
> ++++ opensc-0.22.0/src/tools/opensc-explorer.c
> +@@ -2472,7 +2472,7 @@ int main(int argc, char *argv[])
> +               char *line;
> +               int cargc;
> +               char *cargv[260];
> +-              int multiple;
> ++              int multiple =3D 0;
> +               struct command *cmd;
> +               char prompt[3*SC_MAX_PATH_STRING_SIZE];
> +
> diff --git
> a/package/opensc/0002-package-opensc-fix-strict-aliasing-warnings-as-erro=
rs.patch
> b/package/opensc/0002-package-opensc-fix-strict-aliasing-warnings-as-erro=
rs.patch
> new file mode 100644
> index 0000000000..e66fc21657
> --- /dev/null
> +++
> b/package/opensc/0002-package-opensc-fix-strict-aliasing-warnings-as-erro=
rs.patch
> @@ -0,0 +1,132 @@
> +Index: opensc-0.22.0/src/libopensc/card-gids.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opensc-0.22.0.orig/src/libopensc/card-gids.c
> ++++ opensc-0.22.0/src/libopensc/card-gids.c
> +@@ -691,7 +691,8 @@ static int gids_finish(sc_card_t *card)
> + // the cmap file is used to detect the key algorithm / size
> + static int gids_get_crypto_identifier_from_key_ref(sc_card_t *card,
> const unsigned char keyref, unsigned char *cryptoidentifier) {
> +       struct gids_private_data *data =3D (struct gids_private_data *)
> card->drv_data;
> +-      PCONTAINER_MAP_RECORD records =3D (PCONTAINER_MAP_RECORD)
> data->cmapfile;
> ++      PCONTAINER_MAP_RECORD records =3D
> malloc(sizeof(CONTAINER_MAP_RECORD));
> ++      memcpy(records, data->cmapfile, sizeof(CONTAINER_MAP_RECORD));
> +       int recordsnum =3D (int) (data->cmapfilesize /
> sizeof(CONTAINER_MAP_RECORD));
> +       int index =3D keyref - GIDS_FIRST_KEY_IDENTIFIER;
> +       if (index >=3D recordsnum) {
> +@@ -1112,10 +1113,10 @@ gids_get_all_containers(sc_card_t* card,
> + // return the detail about a container to emulate a pkcs15 card
> + static int
> + gids_get_container_detail(sc_card_t* card,
> sc_cardctl_gids_get_container_t* container) {
> +-      PCONTAINER_MAP_RECORD records =3D NULL;
> ++      PCONTAINER_MAP_RECORD records =3D
> malloc(sizeof(CONTAINER_MAP_RECORD));
> +       struct gids_private_data *privatedata =3D (struct gids_private_da=
ta
> *) card->drv_data;
> +       size_t recordsnum, num, i;
> +-      records =3D (PCONTAINER_MAP_RECORD) privatedata ->cmapfile;
> ++      memcpy(records, privatedata->cmapfile,
> sizeof(CONTAINER_MAP_RECORD));
> +       recordsnum =3D (privatedata ->cmapfilesize /
> sizeof(CONTAINER_MAP_RECORD));
> +
> +       num =3D container->containernum ;
> +@@ -1158,7 +1159,8 @@ gids_get_container_detail(sc_card_t* car
> + static int
> + gids_select_key_reference(sc_card_t *card, sc_pkcs15_prkey_info_t*
> key_info) {
> +       struct gids_private_data *data =3D (struct gids_private_data *)
> card->drv_data;
> +-      PCONTAINER_MAP_RECORD records =3D (PCONTAINER_MAP_RECORD)
> data->cmapfile;
> ++      PCONTAINER_MAP_RECORD records =3D
> malloc(sizeof(CONTAINER_MAP_RECORD));
> ++      memcpy(records, data->cmapfile, sizeof(CONTAINER_MAP_RECORD));
> +       size_t recordsnum;
> +       int r;
> +       char ch_tmp[10];
> +@@ -1302,7 +1304,8 @@ static int gids_create_keyfile(sc_card_t
> +       struct gids_private_data *data =3D (struct gids_private_data *)
> card->drv_data;
> +       size_t recordnum;
> +       size_t containernum =3D key_info->key_reference -
> GIDS_FIRST_KEY_IDENTIFIER;
> +-      PCONTAINER_MAP_RECORD records =3D ((PCONTAINER_MAP_RECORD)
> cmapbuffer) + containernum;
> ++      PCONTAINER_MAP_RECORD records =3D
> malloc(sizeof(CONTAINER_MAP_RECORD));
> ++      memcpy(records, cmapbuffer + containernum,
> sizeof(CONTAINER_MAP_RECORD));
> +       struct gids_keymap_record* keymaprecord =3D NULL;
> +       int i;
> +
> +@@ -1390,12 +1393,12 @@ static int gids_create_keyfile(sc_card_t
> +
> +       // convert char to wchar
> +       for(i =3D 0; i < MAX_CONTAINER_NAME_LEN && object->label[i]; i++)=
 {
> +-              records->wszGuid[i] =3D object->label[i];
> ++              records->wszGuid[i] =3D (unsigned short) object->label[i]=
;
> +       }
> +
> +       // TODO: check if a container with the same name already exists
> and prevent is creation or change its name
> +
> +-      records->bFlags =3D CONTAINER_MAP_VALID_CONTAINER;
> ++      records->bFlags =3D (unsigned char) CONTAINER_MAP_VALID_CONTAINER=
;
> +       if (recordnum =3D=3D 0) {
> +               records->bFlags |=3D CONTAINER_MAP_DEFAULT_CONTAINER;
> +       }
> +@@ -1638,7 +1641,8 @@ static int gids_delete_container_num(sc_
> +       size_t keymaprecordnum =3D 0;
> +       struct gids_private_data *data =3D (struct gids_private_data *)
> card->drv_data;
> +       size_t recordnum;
> +-      PCONTAINER_MAP_RECORD records =3D ((PCONTAINER_MAP_RECORD)
> cmapbuffer) + containernum;
> ++      PCONTAINER_MAP_RECORD records =3D
> malloc(sizeof(CONTAINER_MAP_RECORD));
> ++      memcpy(records, cmapbuffer + containernum,
> sizeof(CONTAINER_MAP_RECORD));
> +       struct gids_keymap_record* keymaprecord =3D NULL;
> +
> +       SC_FUNC_CALLED(card->ctx, SC_LOG_DEBUG_VERBOSE);
> +Index: opensc-0.22.0/src/libopensc/card-gpk.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opensc-0.22.0.orig/src/libopensc/card-gpk.c
> ++++ opensc-0.22.0/src/libopensc/card-gpk.c
> +@@ -228,11 +228,12 @@ static int
> + match_path(sc_card_t *card, unsigned short int **pathptr, size_t
> *pathlen,
> +               int need_info)
> + {
> +-      unsigned short int      *curptr, *ptr;
> ++      u8                      *curptr;
> ++      unsigned short int      *ptr;
> +       size_t          curlen, len;
> +       size_t          i;
> +
> +-      curptr =3D (unsigned short int *) card->cache.current_path.value;
> ++      curptr =3D (u8 *) card->cache.current_path.value;
> +       curlen =3D card->cache.current_path.len;
> +       ptr    =3D *pathptr;
> +       len    =3D *pathlen;
> +@@ -242,7 +243,7 @@ match_path(sc_card_t *card, unsigned sho
> +
> +       /* Make sure path starts with MF.
> +        * Note the cached path should always begin with MF. */
> +-      if (ptr[0] !=3D GPK_FID_MF || curptr[0] !=3D GPK_FID_MF)
> ++      if (ptr[0] !=3D (GPK_FID_MF >> 8) || curptr[0] !=3D (GPK_FID_MF >=
> 8))
> +               return 0;
> +
> +       for (i =3D 1; i < len && i < curlen; i++) {
> +@@ -545,7 +546,7 @@ gpk_select_id(sc_card_t *card, int kind,
> +       /* Fix up the path cache.
> +        * NB we never cache the ID of an EF, just the DF path */
> +       if (r =3D=3D 0) {
> +-              unsigned short int      *path;
> ++              u8      *path;
> +
> +               switch (kind) {
> +               case GPK_SEL_MF:
> +@@ -555,7 +556,7 @@ gpk_select_id(sc_card_t *card, int kind,
> +                       if (cp->len + 1 > SC_MAX_PATH_SIZE / 2) {
> +                               return SC_ERROR_INTERNAL;
> +                       }
> +-                      path =3D (unsigned short int *) cp->value;
> ++                      path =3D (u8 *) cp->value;
> +                       path[cp->len++] =3D fid;
> +               }
> +       } else {
> +Index: opensc-0.22.0/src/tools/gids-tool.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- opensc-0.22.0.orig/src/tools/gids-tool.c
> ++++ opensc-0.22.0/src/tools/gids-tool.c
> +@@ -401,7 +401,8 @@ static int print_info(sc_card_t *card) {
> +               if (cmapfilesize =3D=3D sizeof(cmapfile)) {
> +                       printf("Unable to find the container file
> (mscp\\cmapfile)\n");
> +               } else {
> +-                      PCONTAINER_MAP_RECORD cmaprecords =3D
> (PCONTAINER_MAP_RECORD) cmapfile;
> ++                      PCONTAINER_MAP_RECORD cmaprecords =3D
> malloc(sizeof(CONTAINER_MAP_RECORD));
> ++                      memcpy(cmaprecords, cmapfile,
> sizeof(CONTAINER_MAP_RECORD));
> +                       int cmaprecordnum =3D (cmapfilesize /
> sizeof(CONTAINER_MAP_RECORD));
> +                       int keymaprecordnum =3D -1;
> +                       struct gids_keymap_record* keymaprecord =3D ((str=
uct
> gids_keymap_record*)(keymap +1));
> diff --git a/package/opensc/Config.in b/package/opensc/Config.in
> new file mode 100644
> index 0000000000..d6b137a87f
> --- /dev/null
> +++ b/package/opensc/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_OPENSC
> +       bool "opensc"
> +       depends on !BR2_STATIC_LIBS # dlopen()
> +       select BR2_PACKAGE_PCSC_LITE
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +       help
> +         OpenSC provides a set of libraries and utilities to work
> +         with smart cards.
> +
> +         https://github.com/OpenSC/OpenSC/wiki
> diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
> new file mode 100644
> index 0000000000..1e3472ba2a
> --- /dev/null
> +++ b/package/opensc/opensc.hash
> @@ -0,0 +1,5 @@
> +# From https://https://github.com/OpenSC/OpenSC/releases/
> +sha256  8d4e5347195ebea332be585df61dcc470331c26969e4b0447c851fb0844c7186
> opensc-0.22.0.tar.gz
> +
> +# Computed locally
> +sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14
> COPYING
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> new file mode 100644
> index 0000000000..7221eee944
> --- /dev/null
> +++ b/package/opensc/opensc.mk
> @@ -0,0 +1,14 @@
>
> +########################################################################=
########
> +#
> +# opensc
> +#
>
> +########################################################################=
########
> +
> +OPENSC_VERSION =3D 0.22.0
> +OPENSC_SITE =3D
> https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
> +OPENSC_LICENSE =3D LGPL-2.1+
> +OPENSC_LICENSE_FILES =3D COPYING
> +OPENSC_DEPENDENCIES =3D openssl pcsc-lite
> +OPENSC_INSTALL_STAGING =3D YES
> +
> +$(eval $(autotools-package))
> --
> 2.30.2
>
>

--=20

Jos=C3=A9.

--000000000000dc23ab05d2015c5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><blockquote style=3D"margin:0 0 0 40px;border:non=
e;padding:0px"><div>Hi,</div><div><br></div></blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Any comments in this pa=
tch?</div><div><br></div></blockquote><blockquote style=3D"margin:0 0 0 40p=
x;border:none;padding:0px"><div>Thanks!</div><div><br></div></blockquote><b=
lockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Jos=C3=
=A9.</div></blockquote></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 25, 2021 at 9:23 AM Jos=C3=A9 Pek=
karinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com">jose.pekkarinen@u=
nikie.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The patch will add a basic opensc package to build<br>
on buildroot.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
---<br>
[v1 -&gt; v2] Addressed multiple comments from former rev<br>
[v2 -&gt; v3] Fixed warning of missing signed off patch<br>
<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...ckage-opensc-fix-maybe-uninitialized.patch |=C2=A0 69 +++++++++<br=
>
=C2=A0...x-strict-aliasing-warnings-as-errors.patch | 132 +++++++++++++++++=
+<br>
=C2=A0package/opensc/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 ++<br>
=C2=A0package/opensc/opensc.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0package/opensc/<a href=3D"http://opensc.mk" rel=3D"noreferrer" target=
=3D"_blank">opensc.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 ++<br>
=C2=A07 files changed, 233 insertions(+)<br>
=C2=A0create mode 100644 package/opensc/0001-package-opensc-fix-maybe-unini=
tialized.patch<br>
=C2=A0create mode 100644 package/opensc/0002-package-opensc-fix-strict-alia=
sing-warnings-as-errors.patch<br>
=C2=A0create mode 100644 package/opensc/Config.in<br>
=C2=A0create mode 100644 package/opensc/opensc.hash<br>
=C2=A0create mode 100644 package/opensc/<a href=3D"http://opensc.mk" rel=3D=
"noreferrer" target=3D"_blank">opensc.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 70262eac8c..d92c38f07d 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1455,6 +1455,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 support/testing/tests/p=
ackage/test_zfs.py<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose=
.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt=
;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/softhsm2/<br>
+F:=C2=A0 =C2=A0 =C2=A0package/opensc/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Joseph Kogut &lt;<a href=3D"mailto:joseph.kogut=
@gmail.com" target=3D"_blank">joseph.kogut@gmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/at-spi2-atk/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index e355ab1987..3cfcf372f3 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -1617,6 +1617,7 @@ menu &quot;Hardware handling&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/tslib/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/uhd/Config.in&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 source &quot;package/urg/Config.in&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/opensc/Config.in&quot;<br>
=C2=A0endmenu<br>
<br>
=C2=A0menu &quot;Javascript&quot;<br>
diff --git a/package/opensc/0001-package-opensc-fix-maybe-uninitialized.pat=
ch b/package/opensc/0001-package-opensc-fix-maybe-uninitialized.patch<br>
new file mode 100644<br>
index 0000000000..1f6a2e6f42<br>
--- /dev/null<br>
+++ b/package/opensc/0001-package-opensc-fix-maybe-uninitialized.patch<br>
@@ -0,0 +1,69 @@<br>
+package:opensc: Fix maybe uninitialized issues<br>
+<br>
+This patch will fix some warning treated as errors<br>
+that highlight maybe uninitialized variables.<br>
+<br>
+Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@=
unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
+Index: opensc-0.22.0/src/pkcs15init/pkcs15-asepcos.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- opensc-0.22.0.orig/src/pkcs15init/pkcs15-asepcos.c<br>
++++ opensc-0.22.0/src/pkcs15init/pkcs15-asepcos.c<br>
+@@ -221,7 +221,7 @@ static int asepcos_do_store_pin(sc_profi<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sc_file_t *nfile =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8=C2=A0 buf[64], sbuf[64], *p =3D buf, *q =3D =
sbuf;<br>
+-=C2=A0 =C2=A0 =C2=A0 int r, akn;<br>
++=C2=A0 =C2=A0 =C2=A0 int r, akn =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (auth_info-&gt;auth_type !=3D SC_PKCS15_PIN_=
AUTH_TYPE_PIN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return SC_ERROR_OBJ=
ECT_NOT_VALID;<br>
+Index: opensc-0.22.0/src/libopensc/pkcs15-coolkey.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- opensc-0.22.0.orig/src/libopensc/pkcs15-coolkey.c<br>
++++ opensc-0.22.0/src/libopensc/pkcs15-coolkey.c<br>
+@@ -147,9 +147,9 @@ coolkey_find_matching_cert(sc_card_t *ca<br>
+ static int<br>
+ coolkey_get_attribute_ulong(sc_card_t *card, sc_cardctl_coolkey_object_t =
*obj, CK_ATTRIBUTE_TYPE type, CK_ULONG *value)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 const u8 *val;<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t val_len;<br>
+-=C2=A0 =C2=A0 =C2=A0 u8 data_type;<br>
++=C2=A0 =C2=A0 =C2=A0 const u8 *val =3D malloc(sizeof(u8));<br>
++=C2=A0 =C2=A0 =C2=A0 size_t val_len =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 u8 data_type =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r=C2=A0 =3D coolkey_get_attribute(card, obj, ty=
pe, &amp;val, &amp;val_len, &amp;data_type);<br>
+@@ -168,8 +168,8 @@ static int<br>
+ coolkey_get_attribute_boolean(sc_card_t *card, sc_cardctl_coolkey_object_=
t *obj, CK_ATTRIBUTE_TYPE attr_type)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+-=C2=A0 =C2=A0 =C2=A0 const u8 *val;<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t val_len;<br>
++=C2=A0 =C2=A0 =C2=A0 const u8 *val =3D malloc(sizeof(u8));<br>
++=C2=A0 =C2=A0 =C2=A0 size_t val_len =3D 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D coolkey_get_attribute(card, obj, attr_typ=
e, &amp;val, &amp;val_len, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0) {<br>
+@@ -186,7 +186,7 @@ static int<br>
+ coolkey_get_attribute_bytes(sc_card_t *card, sc_cardctl_coolkey_object_t =
*obj, CK_ATTRIBUTE_TYPE type, u8 *data, size_t *data_len, size_t max_data_l=
en)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const u8 *val;<br>
+-=C2=A0 =C2=A0 =C2=A0 size_t val_len;<br>
++=C2=A0 =C2=A0 =C2=A0 size_t val_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D coolkey_get_attribute(card, obj, type, &a=
mp;val, &amp;val_len, NULL);<br>
+Index: opensc-0.22.0/src/tools/opensc-explorer.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- opensc-0.22.0.orig/src/tools/opensc-explorer.c<br>
++++ opensc-0.22.0/src/tools/opensc-explorer.c<br>
+@@ -2472,7 +2472,7 @@ int main(int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *line;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cargc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *cargv[260];<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int multiple;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int multiple =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct command *cmd=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char prompt[3*SC_MA=
X_PATH_STRING_SIZE];<br>
+ <br>
diff --git a/package/opensc/0002-package-opensc-fix-strict-aliasing-warning=
s-as-errors.patch b/package/opensc/0002-package-opensc-fix-strict-aliasing-=
warnings-as-errors.patch<br>
new file mode 100644<br>
index 0000000000..e66fc21657<br>
--- /dev/null<br>
+++ b/package/opensc/0002-package-opensc-fix-strict-aliasing-warnings-as-er=
rors.patch<br>
@@ -0,0 +1,132 @@<br>
+Index: opensc-0.22.0/src/libopensc/card-gids.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- opensc-0.22.0.orig/src/libopensc/card-gids.c<br>
++++ opensc-0.22.0/src/libopensc/card-gids.c<br>
+@@ -691,7 +691,8 @@ static int gids_finish(sc_card_t *card)<br>
+ // the cmap file is used to detect the key algorithm / size<br>
+ static int gids_get_crypto_identifier_from_key_ref(sc_card_t *card, const=
 unsigned char keyref, unsigned char *cryptoidentifier) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_private_data *data =3D (struct gids=
_private_data *) card-&gt;drv_data;<br>
+-=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D (PCONTAINER_MAP_RE=
CORD) data-&gt;cmapfile;<br>
++=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D malloc(sizeof(CONT=
AINER_MAP_RECORD));<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(records, data-&gt;cmapfile, sizeof(CONTAINER_=
MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int recordsnum =3D (int) (data-&gt;cmapfilesize=
 / sizeof(CONTAINER_MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int index =3D keyref - GIDS_FIRST_KEY_IDENTIFIE=
R;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (index &gt;=3D recordsnum) {<br>
+@@ -1112,10 +1113,10 @@ gids_get_all_containers(sc_card_t* card,<br>
+ // return the detail about a container to emulate a pkcs15 card<br>
+ static int<br>
+ gids_get_container_detail(sc_card_t* card, sc_cardctl_gids_get_container_=
t* container) {<br>
+-=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D malloc(sizeof(CONT=
AINER_MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_private_data *privatedata =3D (stru=
ct gids_private_data *) card-&gt;drv_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t recordsnum, num, i;<br>
+-=C2=A0 =C2=A0 =C2=A0 records =3D (PCONTAINER_MAP_RECORD) privatedata -&gt=
;cmapfile;<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(records, privatedata-&gt;cmapfile, sizeof(CON=
TAINER_MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0recordsnum =3D (privatedata -&gt;cmapfilesize /=
 sizeof(CONTAINER_MAP_RECORD));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0num =3D container-&gt;containernum ;<br>
+@@ -1158,7 +1159,8 @@ gids_get_container_detail(sc_card_t* car<br>
+ static int<br>
+ gids_select_key_reference(sc_card_t *card, sc_pkcs15_prkey_info_t* key_in=
fo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_private_data *data =3D (struct gids=
_private_data *) card-&gt;drv_data;<br>
+-=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D (PCONTAINER_MAP_RE=
CORD) data-&gt;cmapfile;<br>
++=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D malloc(sizeof(CONT=
AINER_MAP_RECORD));<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(records, data-&gt;cmapfile, sizeof(CONTAINER_=
MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t recordsnum;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char ch_tmp[10];<br>
+@@ -1302,7 +1304,8 @@ static int gids_create_keyfile(sc_card_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_private_data *data =3D (struct gids=
_private_data *) card-&gt;drv_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t recordnum;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t containernum =3D key_info-&gt;key_refere=
nce - GIDS_FIRST_KEY_IDENTIFIER;<br>
+-=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D ((PCONTAINER_MAP_R=
ECORD) cmapbuffer) + containernum;<br>
++=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D malloc(sizeof(CONT=
AINER_MAP_RECORD));<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(records, cmapbuffer + containernum, sizeof(CO=
NTAINER_MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_keymap_record* keymaprecord =3D NUL=
L;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+ <br>
+@@ -1390,12 +1393,12 @@ static int gids_create_keyfile(sc_card_t<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// convert char to wchar<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for(i =3D 0; i &lt; MAX_CONTAINER_NAME_LEN &amp=
;&amp; object-&gt;label[i]; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 records-&gt;wszGuid[i] =
=3D object-&gt;label[i];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 records-&gt;wszGuid[i] =
=3D (unsigned short) object-&gt;label[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO: check if a container with the same nam=
e already exists and prevent is creation or change its name<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 records-&gt;bFlags =3D CONTAINER_MAP_VALID_CONTAINER=
;<br>
++=C2=A0 =C2=A0 =C2=A0 records-&gt;bFlags =3D (unsigned char) CONTAINER_MAP=
_VALID_CONTAINER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (recordnum =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0records-&gt;bFlags =
|=3D CONTAINER_MAP_DEFAULT_CONTAINER;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1638,7 +1641,8 @@ static int gids_delete_container_num(sc_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t keymaprecordnum =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_private_data *data =3D (struct gids=
_private_data *) card-&gt;drv_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t recordnum;<br>
+-=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D ((PCONTAINER_MAP_R=
ECORD) cmapbuffer) + containernum;<br>
++=C2=A0 =C2=A0 =C2=A0 PCONTAINER_MAP_RECORD records =3D malloc(sizeof(CONT=
AINER_MAP_RECORD));<br>
++=C2=A0 =C2=A0 =C2=A0 memcpy(records, cmapbuffer + containernum, sizeof(CO=
NTAINER_MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct gids_keymap_record* keymaprecord =3D NUL=
L;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SC_FUNC_CALLED(card-&gt;ctx, SC_LOG_DEBUG_VERBO=
SE);<br>
+Index: opensc-0.22.0/src/libopensc/card-gpk.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- opensc-0.22.0.orig/src/libopensc/card-gpk.c<br>
++++ opensc-0.22.0/src/libopensc/card-gpk.c<br>
+@@ -228,11 +228,12 @@ static int<br>
+ match_path(sc_card_t *card, unsigned short int **pathptr, size_t *pathlen=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int need_info)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 unsigned short int=C2=A0 =C2=A0 =C2=A0 *curptr, *ptr=
;<br>
++=C2=A0 =C2=A0 =C2=A0 u8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *curptr;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned short int=C2=A0 =C2=A0 =C2=A0 *ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curlen=
, len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 curptr =3D (unsigned short int *) card-&gt;cache.cur=
rent_path.value;<br>
++=C2=A0 =C2=A0 =C2=A0 curptr =3D (u8 *) card-&gt;cache.current_path.value;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0curlen =3D card-&gt;cache.current_path.len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ptr=C2=A0 =C2=A0 =3D *pathptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0len=C2=A0 =C2=A0 =3D *pathlen;<br>
+@@ -242,7 +243,7 @@ match_path(sc_card_t *card, unsigned sho<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Make sure path starts with MF.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Note the cached path should always begin wit=
h MF. */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (ptr[0] !=3D GPK_FID_MF || curptr[0] !=3D GPK_FID=
_MF)<br>
++=C2=A0 =C2=A0 =C2=A0 if (ptr[0] !=3D (GPK_FID_MF &gt;&gt; 8) || curptr[0]=
 !=3D (GPK_FID_MF &gt;&gt; 8))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 1; i &lt; len &amp;&amp; i &lt; curl=
en; i++) {<br>
+@@ -545,7 +546,7 @@ gpk_select_id(sc_card_t *card, int kind,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fix up the path cache.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * NB we never cache the ID of an EF, just the =
DF path */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r =3D=3D 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned short int=C2=A0=
 =C2=A0 =C2=A0 *path;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u8=C2=A0 =C2=A0 =C2=A0 *=
path;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (kind) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GPK_SEL_MF:<br=
>
+@@ -555,7 +556,7 @@ gpk_select_id(sc_card_t *card, int kind,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (cp-&gt;len + 1 &gt; SC_MAX_PATH_SIZE / 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return SC_ERROR_INTERNAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 path =3D (unsigned short int *) cp-&gt;value;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 path =3D (u8 *) cp-&gt;value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0path[cp-&gt;len++] =3D fid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+Index: opensc-0.22.0/src/tools/gids-tool.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- opensc-0.22.0.orig/src/tools/gids-tool.c<br>
++++ opensc-0.22.0/src/tools/gids-tool.c<br>
+@@ -401,7 +401,8 @@ static int print_info(sc_card_t *card) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cmapfilesize =
=3D=3D sizeof(cmapfile)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0printf(&quot;Unable to find the container file (mscp\\cmapfile)\n=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PCONTAINER_MAP_RECORD cmaprecords =3D (PCONTAINER_MAP_RECORD) cmapfile;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PCONTAINER_MAP_RECORD cmaprecords =3D malloc(sizeof(CONTAINER_MAP_RECOR=
D));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy(cmaprecords, cmapfile, sizeof(CONTAINER_MAP_RECORD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int cmaprecordnum =3D (cmapfilesize / sizeof(CONTAINER_MAP_RECORD=
));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int keymaprecordnum =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0struct gids_keymap_record* keymaprecord =3D ((struct gids_keymap_=
record*)(keymap +1));<br>
diff --git a/package/opensc/Config.in b/package/opensc/Config.in<br>
new file mode 100644<br>
index 0000000000..d6b137a87f<br>
--- /dev/null<br>
+++ b/package/opensc/Config.in<br>
@@ -0,0 +1,11 @@<br>
+config BR2_PACKAGE_OPENSC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;opensc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_STATIC_LIBS # dlopen()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PCSC_LITE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OpenSC provides a set of libraries and u=
tilities to work<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with smart cards.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/OpenSC/Ope=
nSC/wiki" rel=3D"noreferrer" target=3D"_blank">https://github.com/OpenSC/Op=
enSC/wiki</a><br>
diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash<br>
new file mode 100644<br>
index 0000000000..1e3472ba2a<br>
--- /dev/null<br>
+++ b/package/opensc/opensc.hash<br>
@@ -0,0 +1,5 @@<br>
+# From https://<a href=3D"https://github.com/OpenSC/OpenSC/releases/" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/OpenSC/OpenSC/releases=
/</a><br>
+sha256=C2=A0 8d4e5347195ebea332be585df61dcc470331c26969e4b0447c851fb0844c7=
186=C2=A0 opensc-0.22.0.tar.gz<br>
+<br>
+# Computed locally<br>
+sha256=C2=A0 376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24=
a14=C2=A0 COPYING<br>
diff --git a/package/opensc/<a href=3D"http://opensc.mk" rel=3D"noreferrer"=
 target=3D"_blank">opensc.mk</a> b/package/opensc/<a href=3D"http://opensc.=
mk" rel=3D"noreferrer" target=3D"_blank">opensc.mk</a><br>
new file mode 100644<br>
index 0000000000..7221eee944<br>
--- /dev/null<br>
+++ b/package/opensc/<a href=3D"http://opensc.mk" rel=3D"noreferrer" target=
=3D"_blank">opensc.mk</a><br>
@@ -0,0 +1,14 @@<br>
+##########################################################################=
######<br>
+#<br>
+# opensc<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+OPENSC_VERSION =3D 0.22.0<br>
+OPENSC_SITE =3D <a href=3D"https://github.com/OpenSC/OpenSC/releases/downl=
oad/$(OPENSC_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)</a><br>
+OPENSC_LICENSE =3D LGPL-2.1+<br>
+OPENSC_LICENSE_FILES =3D COPYING<br>
+OPENSC_DEPENDENCIES =3D openssl pcsc-lite<br>
+OPENSC_INSTALL_STAGING =3D YES<br>
+<br>
+$(eval $(autotools-package))<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div>

--000000000000dc23ab05d2015c5f--


--===============2767034920397090765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2767034920397090765==--


