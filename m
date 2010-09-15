From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 15 Sep 2010 09:26:30 +0200
Subject: [Buildroot] [PATCH] samba: add patch to fix buffer overrun
	vulnerability CVE-2010-3069
Message-ID: <1284535590-21711-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/samba-3.3.13-CVE-2010-3069.patch |   86 ++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100644 package/samba/samba-3.3.13-CVE-2010-3069.patch

diff --git a/package/samba/samba-3.3.13-CVE-2010-3069.patch b/package/samba/samba-3.3.13-CVE-2010-3069.patch
new file mode 100644
index 0000000..e26ff73
--- /dev/null
+++ b/package/samba/samba-3.3.13-CVE-2010-3069.patch
@@ -0,0 +1,86 @@
+diff --git a/source/lib/util_sid.c b/source/lib/util_sid.c
+index f656bb1..aa49b86 100644
+--- a/source/lib/util_sid.c
++++ b/source/lib/util_sid.c
+@@ -408,6 +408,9 @@ bool sid_parse(const char *inbuf, size_t len, DOM_SID *sid)
+ 
+ 	sid->sid_rev_num = CVAL(inbuf, 0);
+ 	sid->num_auths = CVAL(inbuf, 1);
++	if (sid->num_auths > MAXSUBAUTHS) {
++		return false;
++	}
+ 	memcpy(sid->id_auth, inbuf+2, 6);
+ 	if (len < 8 + sid->num_auths*4)
+ 		return False;
+diff --git a/source/libads/ldap.c b/source/libads/ldap.c
+index d9598e5..f426996 100644
+--- a/source/libads/ldap.c
++++ b/source/libads/ldap.c
+@@ -2139,7 +2139,9 @@ static void dump_sid(ADS_STRUCT *ads, const char *field, struct berval **values)
+ 	for (i=0; values[i]; i++) {
+ 		DOM_SID sid;
+ 		fstring tmp;
+-		sid_parse(values[i]->bv_val, values[i]->bv_len, &sid);
++		if (!sid_parse(values[i]->bv_val, values[i]->bv_len, &sid)) {
++			continue;
++		}
+ 		printf("%s: %s\n", field, sid_to_fstring(tmp, &sid));
+ 	}
+ }
+diff --git a/source/libsmb/cliquota.c b/source/libsmb/cliquota.c
+index dcdfec2..47739f0 100644
+--- a/source/libsmb/cliquota.c
++++ b/source/libsmb/cliquota.c
+@@ -117,7 +117,9 @@ static bool parse_user_quota_record(const char *rdata, unsigned int rdata_count,
+ 	}
+ #endif /* LARGE_SMB_OFF_T */
+ 
+-	sid_parse(rdata+40,sid_len,&qt.sid);
++	if (!sid_parse(rdata+40,sid_len,&qt.sid)) {
++		return false;
++	}
+ 
+ 	qt.qtype = SMB_USER_QUOTA_TYPE;
+ 
+diff --git a/source/smbd/nttrans.c b/source/smbd/nttrans.c
+index c392380..b610b1f 100644
+--- a/source/smbd/nttrans.c
++++ b/source/smbd/nttrans.c
+@@ -1950,7 +1950,11 @@ static void call_nt_transact_ioctl(connection_struct *conn,
+ 		/* unknown 4 bytes: this is not the length of the sid :-(  */
+ 		/*unknown = IVAL(pdata,0);*/
+ 
+-		sid_parse(pdata+4,sid_len,&sid);
++		if (!sid_parse(pdata+4,sid_len,&sid)) {
++			reply_nterror(req, NT_STATUS_INVALID_PARAMETER);
++			return;
++		}
++
+ 		DEBUGADD(10, ("for SID: %s\n", sid_string_dbg(&sid)));
+ 
+ 		if (!sid_to_uid(&sid, &uid)) {
+@@ -2206,7 +2210,10 @@ static void call_nt_transact_get_user_quota(connection_struct *conn,
+ 				break;
+ 			}
+ 
+-			sid_parse(pdata+8,sid_len,&sid);
++			if (!sid_parse(pdata+8,sid_len,&sid)) {
++				reply_nterror(req, NT_STATUS_INVALID_PARAMETER);
++				return;
++			}
+ 
+ 			if (vfs_get_ntquota(fsp, SMB_USER_QUOTA_TYPE, &sid, &qt)!=0) {
+ 				ZERO_STRUCT(qt);
+@@ -2387,7 +2394,11 @@ static void call_nt_transact_set_user_quota(connection_struct *conn,
+ 	}
+ #endif /* LARGE_SMB_OFF_T */
+ 
+-	sid_parse(pdata+40,sid_len,&sid);
++	if (!sid_parse(pdata+40,sid_len,&sid)) {
++		reply_nterror(req, NT_STATUS_INVALID_PARAMETER);
++		return;
++	}
++
+ 	DEBUGADD(8,("SID: %s\n", sid_string_dbg(&sid)));
+ 
+ 	/* 44 unknown bytes left... */
-- 
1.7.0.4
