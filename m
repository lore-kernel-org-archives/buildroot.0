From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Aug 2020 08:17:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: fix build with
 dovecot 2.3.11.3
Message-ID: <20200820061744.293397-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The security bump of dovecot to version 2.3.11.3 causes build errors
with dovecot-pigeonhole 0.5.10.

Fixes:
http://autobuild.buildroot.net/results/76d/76d22150b359688ca8b33f5c18dd0aac90171557/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
An alternative fix would be to cherry-pick
https://git.buildroot.net/buildroot/commit/?h=next&id=042656980b306e233ec1651b90b8bbc7680bd3d6
to the master branch.

 .../dovecot-pigeonhole/0001-PRIuSIZE_T.patch  | 250 ++++++++++++++++++
 .../0002-global-Remove-dead-assignments.patch |  84 ++++++
 .../0003-message_parser_init.patch            |  67 +++++
 ...ust-to-core-login-common-API-changes.patch | 214 +++++++++++++++
 4 files changed, 615 insertions(+)
 create mode 100644 package/dovecot-pigeonhole/0001-PRIuSIZE_T.patch
 create mode 100644 package/dovecot-pigeonhole/0002-global-Remove-dead-assignments.patch
 create mode 100644 package/dovecot-pigeonhole/0003-message_parser_init.patch
 create mode 100644 package/dovecot-pigeonhole/0004-managesieve-login-Adjust-to-core-login-common-API-changes.patch

diff --git a/package/dovecot-pigeonhole/0001-PRIuSIZE_T.patch b/package/dovecot-pigeonhole/0001-PRIuSIZE_T.patch
new file mode 100644
index 0000000000..6ccb3980b6
--- /dev/null
+++ b/package/dovecot-pigeonhole/0001-PRIuSIZE_T.patch
@@ -0,0 +1,250 @@
+From 301a5c444d0b738f0340812267b372c52a8fa990 Mon Sep 17 00:00:00 2001
+From: Josef 'Jeff' Sipek <jeff.sipek@open-xchange.com>
+Date: Tue, 17 Mar 2020 09:33:24 -0400
+Subject: [PATCH] global: use %zu directly instead of PRIuSIZE_T
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://github.com/dovecot/pigeonhole/commit/301a5c444d0b738f0340812267b372c52a8fa990]
+---
+ src/lib-managesieve/managesieve-arg.c                    | 2 +-
+ src/lib-managesieve/managesieve-quote.c                  | 2 +-
+ src/lib-sieve/plugins/editheader/cmd-addheader.c         | 4 ++--
+ src/lib-sieve/plugins/editheader/ext-editheader-common.c | 2 +-
+ src/lib-sieve/plugins/variables/ext-variables-common.c   | 2 +-
+ src/lib-sieve/sieve-binary-dumper.c                      | 7 +++----
+ src/lib-sieve/sieve-binary-file.c                        | 2 +-
+ src/lib-sieve/sieve-lexer.c                              | 2 +-
+ src/lib-sieve/storage/ldap/sieve-ldap-db.c               | 2 +-
+ src/managesieve/cmd-havespace.c                          | 2 +-
+ src/managesieve/managesieve-quota.c                      | 8 +++-----
+ src/plugins/imap-filter-sieve/cmd-filter-sieve.c         | 2 +-
+ src/plugins/imap-filter-sieve/imap-filter.c              | 4 ++--
+ 13 files changed, 19 insertions(+), 22 deletions(-)
+
+diff --git a/src/lib-managesieve/managesieve-arg.c b/src/lib-managesieve/managesieve-arg.c
+index b05e9518..178bf450 100644
+--- a/src/lib-managesieve/managesieve-arg.c
++++ b/src/lib-managesieve/managesieve-arg.c
+@@ -167,7 +167,7 @@ void managesieve_write_arg(string_t *dest, const struct managesieve_arg *arg)
+ 		break;
+ 	case MANAGESIEVE_ARG_LITERAL: {
+ 		const char *strarg = managesieve_arg_as_string(arg);
+-		str_printfa(dest, "{%"PRIuSIZE_T"}\r\n",
++		str_printfa(dest, "{%zu}\r\n",
+ 			    strlen(strarg));
+ 		str_append(dest, strarg);
+ 		break;
+diff --git a/src/lib-managesieve/managesieve-quote.c b/src/lib-managesieve/managesieve-quote.c
+index 4e60ce47..a86818cd 100644
+--- a/src/lib-managesieve/managesieve-quote.c
++++ b/src/lib-managesieve/managesieve-quote.c
+@@ -60,7 +60,7 @@ void managesieve_quote_append(string_t *str, const unsigned char *value,
+ 		str_append_c(str, '"');
+ 	} else {
+ 		/* return as literal */
+-		str_printfa(str, "{%"PRIuSIZE_T"}\r\n", value_len - extra);
++		str_printfa(str, "{%zu}\r\n", value_len - extra);
+ 	}
+ 
+ 	tmp = t_str_new(value_len+escape+4);
+diff --git a/src/lib-sieve/plugins/editheader/cmd-addheader.c b/src/lib-sieve/plugins/editheader/cmd-addheader.c
+index 08f86b80..f39cbb73 100644
+--- a/src/lib-sieve/plugins/editheader/cmd-addheader.c
++++ b/src/lib-sieve/plugins/editheader/cmd-addheader.c
+@@ -170,7 +170,7 @@ static bool cmd_addheader_validate
+ 
+ 		if ( ext_editheader_header_too_large(cmd->ext, str_len(fvalue)) ) {
+ 			sieve_argument_validate_error(valdtr, arg, "addheader command: "
+-				"specified header value `%s' is too large (%"PRIuSIZE_T" bytes)",
++				"specified header value `%s' is too large (%zu bytes)",
+ 				str_sanitize(str_c(fvalue), 80), str_len(fvalue));
+ 			return SIEVE_EXEC_FAILURE;
+ 		}
+@@ -317,7 +317,7 @@ static int cmd_addheader_operation_execute
+ 
+ 	if ( ext_editheader_header_too_large(this_ext, str_len(value)) ) {
+ 		sieve_runtime_error(renv, NULL, "addheader action: "
+-			"specified header value `%s' is too large (%"PRIuSIZE_T" bytes)",
++			"specified header value `%s' is too large (%zu bytes)",
+ 			str_sanitize(str_c(value), 80), str_len(value));
+ 		return SIEVE_EXEC_FAILURE;
+ 	}
+diff --git a/src/lib-sieve/plugins/editheader/ext-editheader-common.c b/src/lib-sieve/plugins/editheader/ext-editheader-common.c
+index 3a19da65..2bfe6799 100644
+--- a/src/lib-sieve/plugins/editheader/ext-editheader-common.c
++++ b/src/lib-sieve/plugins/editheader/ext-editheader-common.c
+@@ -120,7 +120,7 @@ bool ext_editheader_load
+ 			if ( max_header_size < EXT_EDITHEADER_MINIMUM_MAX_HEADER_SIZE ) {
+ 				e_warning(svinst->event, "editheader: "
+ 					  "value of sieve_editheader_max_header_size setting "
+-					  "(=%"PRIuSIZE_T") is less than the minimum (=%"PRIuSIZE_T") "
++					  "(=%zu) is less than the minimum (=%zu) "
+ 					  "(ignored)", max_header_size,
+ 					  (size_t) EXT_EDITHEADER_MINIMUM_MAX_HEADER_SIZE);
+ 			} else {
+diff --git a/src/lib-sieve/plugins/variables/ext-variables-common.c b/src/lib-sieve/plugins/variables/ext-variables-common.c
+index 99ca79e3..be9f677a 100644
+--- a/src/lib-sieve/plugins/variables/ext-variables-common.c
++++ b/src/lib-sieve/plugins/variables/ext-variables-common.c
+@@ -88,7 +88,7 @@ ext_variables_load(const struct sieve_extension *ext, void **context)
+ 			e_warning(svinst->event, "variables: "
+ 				  "setting sieve_variables_max_variable_size "
+ 				  "is lower than required by standards "
+-				  "(>= %"PRIuSIZE_T" bytes)",
++				  "(>= %zu bytes)",
+ 				  (size_t)EXT_VARIABLES_REQUIRED_MAX_VARIABLE_SIZE);
+ 		} else {
+ 			config->max_variable_size = size_setting;
+diff --git a/src/lib-sieve/sieve-binary-dumper.c b/src/lib-sieve/sieve-binary-dumper.c
+index 499763ea..dfd475b5 100644
+--- a/src/lib-sieve/sieve-binary-dumper.c
++++ b/src/lib-sieve/sieve-binary-dumper.c
+@@ -119,7 +119,7 @@ bool sieve_binary_dumper_run(struct sieve_binary_dumper *dumper,
+ 				sieve_binary_block_get(sbin, i);
+ 
+ 			sieve_binary_dumpf(
+-				denv, "%3d: size: %"PRIuSIZE_T" bytes\n",
++				denv, "%3d: size: %zu bytes\n",
+ 				i, sieve_binary_block_get_size(sblock));
+ 		}
+ 	}
+@@ -234,7 +234,7 @@ void sieve_binary_dumper_hexdump(struct sieve_binary_dumper *dumper,
+ 		struct sieve_binary_block *sblock =
+ 			sieve_binary_block_get(sbin, i);
+ 
+-		sieve_binary_dumpf(denv, "%3d: size: %"PRIuSIZE_T" bytes\n",
++		sieve_binary_dumpf(denv, "%3d: size: %zu bytes\n",
+ 				   i, sieve_binary_block_get_size(sblock));
+ 	}
+ 
+@@ -253,8 +253,7 @@ void sieve_binary_dumper_hexdump(struct sieve_binary_dumper *dumper,
+ 
+ 		// FIXME: calculate offset more nicely.
+ 		sieve_binary_dump_sectionf(
+-			denv, "Block %d (%"PRIuSIZE_T" bytes, "
+-			"file offset %08llx)", i, data_size,
++			denv, "Block %d (%zu bytes, file offset %08llx)", i, data_size,
+ 			(unsigned long long int)sblock->offset + 8);
+ 
+ 		line = t_str_new(128);
+diff --git a/src/lib-sieve/sieve-binary-file.c b/src/lib-sieve/sieve-binary-file.c
+index 602bf395..832177ec 100644
+--- a/src/lib-sieve/sieve-binary-file.c
++++ b/src/lib-sieve/sieve-binary-file.c
+@@ -110,7 +110,7 @@ _save_full(struct sieve_binary *sbin, struct ostream *stream,
+ 
+ 		if ((ret = o_stream_send(stream, pdata, bytes_left)) <= 0) {
+ 			e_error(sbin->event, "save: "
+-				"failed to write %"PRIuSIZE_T" bytes "
++				"failed to write %zu bytes "
+ 				"to output stream: %s", bytes_left,
+ 				strerror(stream->stream_errno));
+ 			return FALSE;
+diff --git a/src/lib-sieve/sieve-lexer.c b/src/lib-sieve/sieve-lexer.c
+index efc3d064..a6968a99 100644
+--- a/src/lib-sieve/sieve-lexer.c
++++ b/src/lib-sieve/sieve-lexer.c
+@@ -69,7 +69,7 @@ sieve_lexer_create(struct sieve_script *script,
+ 	    svinst->max_script_size > 0 &&
+ 	    (uoff_t)st->st_size > svinst->max_script_size) {
+ 		sieve_error(ehandler, sieve_script_name(script),
+-			"sieve script is too large (max %"PRIuSIZE_T" bytes)",
++			"sieve script is too large (max %zu bytes)",
+ 			svinst->max_script_size);
+ 		if (error_r != NULL)
+ 			*error_r = SIEVE_ERROR_NOT_POSSIBLE;
+diff --git a/src/lib-sieve/storage/ldap/sieve-ldap-db.c b/src/lib-sieve/storage/ldap/sieve-ldap-db.c
+index 1ce67b87..0a7b4409 100644
+--- a/src/lib-sieve/storage/ldap/sieve-ldap-db.c
++++ b/src/lib-sieve/storage/ldap/sieve-ldap-db.c
+@@ -1150,7 +1150,7 @@ sieve_ldap_db_get_script(struct ldap_connection *conn,
+ 			data = i_malloc(size);
+ 
+ 			e_debug(storage->event, "db: "
+-				"Found script with length %"PRIuSIZE_T, size);
++				"Found script with length %zu", size);
+ 
+ 			memcpy(data, vals[0]->bv_val, size);
+ 		
+diff --git a/src/managesieve/cmd-havespace.c b/src/managesieve/cmd-havespace.c
+index 468a9234..825c4f03 100644
+--- a/src/managesieve/cmd-havespace.c
++++ b/src/managesieve/cmd-havespace.c
+@@ -53,7 +53,7 @@ bool cmd_havespace(struct client_command_context *cmd)
+ 	struct event_passthrough *e =
+ 		client_command_create_finish_event(cmd);
+ 	e_debug(e->event(), "Quota is within limits for script `%s' "
+-		"with size %"PRIuSIZE_T, scriptname, size);
++		"with size %zu", scriptname, size);
+ 
+ 	client_send_ok(client, "Putscript would succeed.");
+ 	return TRUE;
+diff --git a/src/managesieve/managesieve-quota.c b/src/managesieve/managesieve-quota.c
+index 1ac3afbc..07b58caf 100644
+--- a/src/managesieve/managesieve-quota.c
++++ b/src/managesieve/managesieve-quota.c
+@@ -31,8 +31,7 @@ bool managesieve_quota_check_validsize(struct client_command_context *cmd,
+ 		struct event_passthrough *e =
+ 			client_command_create_finish_event(cmd);
+ 		e_debug(e->event(),
+-			"Script size check failed "
+-			"(size %"PRIuSIZE_T" bytes): %s",
++			"Script size check failed (size %zu bytes): %s",
+ 			size, error_msg);
+ 
+ 		client_send_noresp(client, "QUOTA/MAXSIZE", error_msg);
+@@ -57,7 +56,7 @@ bool managesieve_quota_check_all(struct client_command_context *cmd,
+ 	if (ret < 0) {
+ 		client_command_storage_error(
+ 			cmd, "Failed to check quota for script `%s' "
+-			     "(size %"PRIuSIZE_T" bytes)", scriptname, size);
++			     "(size %zu bytes)", scriptname, size);
+ 		return FALSE;
+ 	}
+ 
+@@ -89,8 +88,7 @@ bool managesieve_quota_check_all(struct client_command_context *cmd,
+ 		client_command_create_finish_event(cmd)->
+ 		add_str("error", error_msg);
+ 	e_debug(e->event(),
+-		"Quota check failed for script `%s' "
+-		"(size %"PRIuSIZE_T" bytes): %s",
++		"Quota check failed for script `%s' (size %zu bytes): %s",
+ 		scriptname, size, error_msg);
+ 
+ 	client_send_noresp(client, resp_code, error_msg);
+diff --git a/src/plugins/imap-filter-sieve/cmd-filter-sieve.c b/src/plugins/imap-filter-sieve/cmd-filter-sieve.c
+index 4b2b5a6a..79ed591f 100644
+--- a/src/plugins/imap-filter-sieve/cmd-filter-sieve.c
++++ b/src/plugins/imap-filter-sieve/cmd-filter-sieve.c
+@@ -28,7 +28,7 @@ cmd_filter_sieve_compile_script(struct imap_filter_context *ctx)
+ 		
+ 	o_stream_nsend_str(client->output,
+ 		t_strdup_printf("* FILTER (TAG %s) "
+-				"%s {%"PRIuSIZE_T"}\r\n",
++				"%s {%zu}\r\n",
+ 				cmd->tag, (ret < 0 ? "ERRORS" : "WARNINGS"),
+ 				str_len(errors)));
+ 	o_stream_nsend(client->output,
+diff --git a/src/plugins/imap-filter-sieve/imap-filter.c b/src/plugins/imap-filter-sieve/imap-filter.c
+index a21ac86e..2255839d 100644
+--- a/src/plugins/imap-filter-sieve/imap-filter.c
++++ b/src/plugins/imap-filter-sieve/imap-filter.c
+@@ -50,7 +50,7 @@ imap_filter_mail(struct client_command_context *cmd, struct mail *mail)
+ 	str_printfa(reply, "* %u FILTERED (TAG %s) UID %u ",
+ 		    mail->seq, cmd->tag, mail->uid);
+ 	if (ret < 0 || have_warnings) {
+-		str_printfa(reply, "%s {%"PRIuSIZE_T"}\r\n",
++		str_printfa(reply, "%s {%zu}\r\n",
+ 			    (ret < 0 ? "ERRORS" : "WARNINGS"),
+ 			    str_len(errors));
+ 		str_append_str(reply, errors);
+@@ -159,7 +159,7 @@ imap_filter_start(struct imap_filter_context *ctx,
+ 
+ 		o_stream_nsend_str(cmd->client->output,
+ 			t_strdup_printf("* FILTER (TAG %s) "
+-				"ERRORS {%"PRIuSIZE_T"}\r\n%s\r\n",
++				"ERRORS {%zu}\r\n%s\r\n",
+ 				cmd->tag, strlen(error), error));
+ 		client_send_tagline(cmd,
+ 			"NO Failed to initialize script execution");
diff --git a/package/dovecot-pigeonhole/0002-global-Remove-dead-assignments.patch b/package/dovecot-pigeonhole/0002-global-Remove-dead-assignments.patch
new file mode 100644
index 0000000000..26d7579091
--- /dev/null
+++ b/package/dovecot-pigeonhole/0002-global-Remove-dead-assignments.patch
@@ -0,0 +1,84 @@
+From ff7d90899707bf7df36a755fd3ca36beed2fffc8 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Tue, 24 Mar 2020 17:59:18 +0200
+Subject: [PATCH] global: Remove dead assignments
+
+Found by latest clang scan-build.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Needed for patch 0003, downloaded from upstream commit
+ https://github.com/dovecot/pigeonhole/commit/ff7d90899707bf7df36a755fd3ca36beed2fffc8]
+---
+ src/lib-sieve/plugins/vnd.dovecot/report/cmd-report.c    | 4 ++--
+ src/lib-sieve/sieve-message.c                            | 4 +---
+ src/plugins/sieve-extprograms/sieve-extprograms-common.c | 5 ++---
+ 3 files changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/src/lib-sieve/plugins/vnd.dovecot/report/cmd-report.c b/src/lib-sieve/plugins/vnd.dovecot/report/cmd-report.c
+index d39ec50f..5d5ee46c 100644
+--- a/src/lib-sieve/plugins/vnd.dovecot/report/cmd-report.c
++++ b/src/lib-sieve/plugins/vnd.dovecot/report/cmd-report.c
+@@ -490,9 +490,9 @@ act_report_send(const struct sieve_action_exec_env *aenv,
+ 		report_from.type = SIEVE_ADDRESS_SOURCE_DEFAULT;
+ 		report_from.address = NULL;
+ 	}
+-	if ((ret = sieve_address_source_get_address(
++	if (sieve_address_source_get_address(
+ 		&report_from, svinst, senv, msgctx, eenv->flags,
+-		&sender)) > 0 && sender != NULL)
++		&sender) > 0 && sender != NULL)
+ 		from = smtp_address_encode_path(sender);
+ 	else
+ 		from = sieve_get_postmaster_address(senv);
+diff --git a/src/lib-sieve/sieve-message.c b/src/lib-sieve/sieve-message.c
+index afbf31f7..f4179bca 100644
+--- a/src/lib-sieve/sieve-message.c
++++ b/src/lib-sieve/sieve-message.c
+@@ -1096,7 +1096,6 @@ static int sieve_message_parts_add_missing
+ 	unsigned int idx = 0;
+ 	bool save_body = FALSE, have_all;
+ 	string_t *hdr_content = NULL;
+-	int ret;
+ 
+ 	/* First check whether any are missing */
+ 	if ( !iter_all && sieve_message_body_get_return_parts
+@@ -1134,8 +1133,7 @@ static int sieve_message_parts_add_missing
+ 		// hparser_flags, mparser_flags);
+ 	parser = message_parser_init(pool_datastack_create(),
+ 		input, hparser_flags, mparser_flags);
+-	while ( (ret=message_parser_parse_next_block
+-		(parser, &block)) > 0 ) {
++	while ( message_parser_parse_next_block(parser, &block) > 0 ) {
+ 		struct sieve_message_part **body_part_idx;
+ 		struct message_header_line *hdr = block.hdr;
+ 		struct sieve_message_header *header;
+diff --git a/src/plugins/sieve-extprograms/sieve-extprograms-common.c b/src/plugins/sieve-extprograms/sieve-extprograms-common.c
+index 2da3ab18..65942fd4 100644
+--- a/src/plugins/sieve-extprograms/sieve-extprograms-common.c
++++ b/src/plugins/sieve-extprograms/sieve-extprograms-common.c
+@@ -418,7 +418,6 @@ struct sieve_extprogram *sieve_extprogram_create
+ 	const char *path = NULL;
+ 	struct stat st;
+ 	bool fork = FALSE;
+-	int ret;
+ 
+ 	e_debug(svinst->event, "action %s: "
+ 		"running program: %s", action, program_name);
+@@ -437,7 +436,7 @@ struct sieve_extprogram *sieve_extprogram_create
+ 	if ( ext_config->socket_dir != NULL ) {
+ 		path = t_strconcat(senv->user->set->base_dir, "/",
+ 			ext_config->socket_dir, "/", program_name, NULL);
+-		if ( (ret=stat(path, &st)) < 0 ) {
++		if ( stat(path, &st) < 0 ) {
+ 			switch ( errno ) {
+ 			case ENOENT:
+ 				e_debug(svinst->event, "action %s: "
+@@ -471,7 +470,7 @@ struct sieve_extprogram *sieve_extprogram_create
+ 	if ( path == NULL && ext_config->bin_dir != NULL ) {
+ 		fork = TRUE;
+ 		path = t_strconcat(ext_config->bin_dir, "/", program_name, NULL);
+-		if ( (ret=stat(path, &st)) < 0 ) {
++		if ( stat(path, &st) < 0 ) {
+ 			switch ( errno ) {
+ 			case ENOENT:
+ 				e_debug(svinst->event, "action %s: "
diff --git a/package/dovecot-pigeonhole/0003-message_parser_init.patch b/package/dovecot-pigeonhole/0003-message_parser_init.patch
new file mode 100644
index 0000000000..3aa9f86d98
--- /dev/null
+++ b/package/dovecot-pigeonhole/0003-message_parser_init.patch
@@ -0,0 +1,67 @@
+From cb631066bd58ad3b495b3938f5c0e0f9d68308df Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Tue, 19 May 2020 15:40:04 +0300
+Subject: [PATCH] lib-sieve: Adjust to message_parser_init() API change
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://github.com/dovecot/pigeonhole/commit/cb631066bd58ad3b495b3938f5c0e0f9d68308df]
+---
+ src/lib-sieve/plugins/notify/ext-notify-common.c |  6 +++++-
+ src/lib-sieve/sieve-message.c                    | 12 ++++++------
+ 2 files changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/src/lib-sieve/plugins/notify/ext-notify-common.c b/src/lib-sieve/plugins/notify/ext-notify-common.c
+index 700b79d1..589b21bf 100644
+--- a/src/lib-sieve/plugins/notify/ext-notify-common.c
++++ b/src/lib-sieve/plugins/notify/ext-notify-common.c
+@@ -189,7 +189,11 @@ cmd_notify_extract_body_text(const struct sieve_runtime_env *renv,
+ 	/* Initialize body decoder */
+ 	decoder = message_decoder_init(NULL, 0);
+ 
+-	parser = message_parser_init(mctx->pool, input, 0, 0);
++	struct message_parser_settings mparser_set = {
++		.hdr_flags = 0,
++		.flags = 0,
++	};
++	parser = message_parser_init(mctx->pool, input, &mparser_set);
+ 	is_text = TRUE;
+ 	save_body = FALSE;
+ 	while ((ret = message_parser_parse_next_block(parser, &block)) > 0) {
+diff --git a/src/lib-sieve/sieve-message.c b/src/lib-sieve/sieve-message.c
+index f4179bca..57c5daa4 100644
+--- a/src/lib-sieve/sieve-message.c
++++ b/src/lib-sieve/sieve-message.c
+@@ -1081,10 +1081,10 @@ static int sieve_message_parts_add_missing
+ 	struct sieve_message_context *msgctx = renv->msgctx;
+ 	pool_t pool = msgctx->context_pool;
+ 	struct mail *mail = sieve_message_get_mail(renv->msgctx);
+-	enum message_parser_flags mparser_flags =
+-		MESSAGE_PARSER_FLAG_INCLUDE_MULTIPART_BLOCKS;
+-	enum message_header_parser_flags hparser_flags =
+-		MESSAGE_HEADER_PARSER_FLAG_SKIP_INITIAL_LWSP;
++	struct message_parser_settings mparser_set = {
++		.hdr_flags = MESSAGE_HEADER_PARSER_FLAG_SKIP_INITIAL_LWSP,
++		.flags = MESSAGE_PARSER_FLAG_INCLUDE_MULTIPART_BLOCKS,
++	};
+ 	ARRAY(struct sieve_message_header) headers;
+ 	struct sieve_message_part *body_part, *header_part, *last_part;
+ 	struct message_parser_ctx *parser;
+@@ -1120,7 +1120,7 @@ static int sieve_message_parts_add_missing
+ 	if (iter_all) {
+ 		t_array_init(&headers, 64);
+ 		hdr_content = t_str_new(512);
+-		hparser_flags |= MESSAGE_HEADER_PARSER_FLAG_CLEAN_ONELINE;
++		mparser_set.hdr_flags |= MESSAGE_HEADER_PARSER_FLAG_CLEAN_ONELINE;
+ 	} else {
+ 		i_zero(&headers);
+ 	}
+@@ -1132,7 +1132,7 @@ static int sieve_message_parts_add_missing
+ 		//parser = message_parser_init_from_parts(parts, input,
+ 		// hparser_flags, mparser_flags);
+ 	parser = message_parser_init(pool_datastack_create(),
+-		input, hparser_flags, mparser_flags);
++		input, &mparser_set);
+ 	while ( message_parser_parse_next_block(parser, &block) > 0 ) {
+ 		struct sieve_message_part **body_part_idx;
+ 		struct message_header_line *hdr = block.hdr;
diff --git a/package/dovecot-pigeonhole/0004-managesieve-login-Adjust-to-core-login-common-API-changes.patch b/package/dovecot-pigeonhole/0004-managesieve-login-Adjust-to-core-login-common-API-changes.patch
new file mode 100644
index 0000000000..c215707795
--- /dev/null
+++ b/package/dovecot-pigeonhole/0004-managesieve-login-Adjust-to-core-login-common-API-changes.patch
@@ -0,0 +1,214 @@
+From 568c72e7b7191a026453c7f3fae3bdc0b1c5d290 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Fri, 10 Apr 2020 01:02:50 +0300
+Subject: [PATCH] managesieve-login: Adjust to core login-common API changes.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[downloaded from upstream commit
+ https://github.com/dovecot/pigeonhole/commit/568c72e7b7191a026453c7f3fae3bdc0b1c5d290]
+---
+ src/managesieve-login/client.c            |  4 ++
+ src/managesieve-login/managesieve-proxy.c | 65 ++++++++++++-----------
+ 2 files changed, 37 insertions(+), 32 deletions(-)
+
+diff --git a/src/managesieve-login/client.c b/src/managesieve-login/client.c
+index e124a400..59f933b5 100644
+--- a/src/managesieve-login/client.c
++++ b/src/managesieve-login/client.c
+@@ -535,6 +535,10 @@ static const struct login_binary managesieve_login_binary = {
+ 	.anonymous_login_acceptable = FALSE,
+ };
+ 
++struct event_category login_event_category = {
++	.name = "managesieve",
++};
++
+ int main(int argc, char *argv[])
+ {
+ 	return login_binary_run(&managesieve_login_binary, argc, argv);
+diff --git a/src/managesieve-login/managesieve-proxy.c b/src/managesieve-login/managesieve-proxy.c
+index d446ef56..2fae6cce 100644
+--- a/src/managesieve-login/managesieve-proxy.c
++++ b/src/managesieve-login/managesieve-proxy.c
+@@ -77,7 +77,7 @@ static int proxy_write_auth
+ 	if ( !client->proxy_sasl ) {
+ 		/* Prevent sending credentials to a server that has login disabled;
+ 		   i.e., due to the lack of TLS */
+-		client_log_err(&client->common, "proxy: "
++		e_error(login_proxy_get_event(client->common.login_proxy),
+ 			"Server has disabled authentication (TLS required?)");
+ 		return -1;
+ 	}
+@@ -99,9 +99,9 @@ static int proxy_write_auth
+ 	managesieve_quote_append_string(str, mech_name, FALSE);
+ 	if (dsasl_client_output(client->common.proxy_sasl_client,
+ 				&output, &len, &error) < 0) {
+-		client_log_err(&client->common, t_strdup_printf(
+-			"proxy: SASL mechanism %s init failed: %s",
+-			mech_name, error));
++		e_error(login_proxy_get_event(client->common.login_proxy),
++			"SASL mechanism %s init failed: %s",
++			mech_name, error);
+ 		return -1;
+ 	}
+ 	if (len > 0) {
+@@ -142,9 +142,9 @@ static int proxy_input_auth_challenge
+ 		if ( ret > 0 && managesieve_arg_get_string(&args[0], &challenge) ) {
+ 			*challenge_r = t_strdup(challenge);
+ 		} else {
+-			client_log_err(&client->common, t_strdup_printf("proxy: "
++			e_error(login_proxy_get_event(client->common.login_proxy),
+ 				"Server sent invalid SASL challenge line: %s",
+-				str_sanitize(line,160)));
++				str_sanitize(line,160));
+ 			fatal = TRUE;
+ 		}
+ 
+@@ -157,9 +157,9 @@ static int proxy_input_auth_challenge
+ 		error_str = (error_str != NULL ? error_str : "unknown (bug)" );
+ 
+ 		/* Do not accept faulty server */
+-		client_log_err(&client->common, t_strdup_printf("proxy: "
++		e_error(login_proxy_get_event(client->common.login_proxy),
+ 			"Protocol parse error(%d) int SASL challenge line: %s (line=`%s')",
+-			ret, error_str, line));
++			ret, error_str, line);
+ 		fatal = TRUE;
+ 	}
+ 
+@@ -183,8 +183,8 @@ static int proxy_write_auth_response
+ 	int ret;
+ 
+ 	if (base64_decode(challenge, strlen(challenge), NULL, str) < 0) {
+-		client_log_err(&client->common,
+-			"proxy: Server sent invalid base64 data in AUTHENTICATE response");
++		e_error(login_proxy_get_event(client->common.login_proxy),
++			"Server sent invalid base64 data in AUTHENTICATE response");
+ 		return -1;
+ 	}
+ 	ret = dsasl_client_input(client->common.proxy_sasl_client,
+@@ -194,9 +194,8 @@ static int proxy_write_auth_response
+ 					  &data, &data_len, &error);
+ 	}
+ 	if (ret < 0) {
+-		client_log_err(&client->common, t_strdup_printf(
+-			"proxy: Server sent invalid authentication data: %s",
+-			error));
++		e_error(login_proxy_get_event(client->common.login_proxy),
++			"Server sent invalid authentication data: %s", error);
+ 		return -1;
+ 	}
+ 	i_assert(ret == 0);
+@@ -261,18 +260,18 @@ static int proxy_input_capability
+ 	ret = managesieve_parser_read_args(parser, 2, 0, &args);
+ 
+ 	if ( ret == 0 ) {
+-		client_log_err(&client->common, t_strdup_printf("proxy: "
++		e_error(login_proxy_get_event(client->common.login_proxy),
+ 			"Remote returned with invalid capability/greeting line: %s",
+-			str_sanitize(line,160)));
++			str_sanitize(line,160));
+ 		fatal = TRUE;
+ 	} else if ( ret > 0 ) {
+ 		if ( args[0].type == MANAGESIEVE_ARG_ATOM ) {
+ 			*resp_r = proxy_read_response(args);
+ 
+ 			if ( *resp_r == MANAGESIEVE_RESPONSE_NONE ) {
+-				client_log_err(&client->common, t_strdup_printf("proxy: "
++				e_error(login_proxy_get_event(client->common.login_proxy),
+ 					"Remote sent invalid response: %s",
+-					str_sanitize(line,160)));
++					str_sanitize(line,160));
+ 
+ 				fatal = TRUE;
+ 			}
+@@ -292,8 +291,8 @@ static int proxy_input_capability
+ 					}
+ 
+ 				} else {
+-					client_log_err(&client->common, "proxy: "
+-		         		"Server returned erroneous SASL capability");
++					e_error(login_proxy_get_event(client->common.login_proxy),
++						"Server returned erroneous SASL capability");
+ 					fatal = TRUE;
+ 				}
+ 
+@@ -305,9 +304,9 @@ static int proxy_input_capability
+ 
+ 		} else {
+ 			/* Do not accept faulty server */
+-			client_log_err(&client->common, t_strdup_printf("proxy: "
++			e_error(login_proxy_get_event(client->common.login_proxy),
+ 				"Remote returned with invalid capability/greeting line: %s",
+-				str_sanitize(line,160)));
++				str_sanitize(line,160));
+ 			fatal = TRUE;
+ 		}
+ 
+@@ -320,9 +319,9 @@ static int proxy_input_capability
+ 		error_str = (error_str != NULL ? error_str : "unknown (bug)" );
+ 
+ 		/* Do not accept faulty server */
+-		client_log_err(&client->common, t_strdup_printf("proxy: "
++		e_error(login_proxy_get_event(client->common.login_proxy),
+ 			"Protocol parse error(%d) in capability/greeting line: %s (line=`%s')",
+-			ret, error_str, line));
++			ret, error_str, line);
+ 		fatal = TRUE;
+ 	}
+ 
+@@ -362,7 +361,7 @@ int managesieve_proxy_parse_line(struct client *client, const char *line)
+ 
+ 		if ( ret == 0 ) {
+ 			if ( response != MANAGESIEVE_RESPONSE_OK ) {
+-				client_log_err(client, "proxy: "
++				e_error(login_proxy_get_event(client->login_proxy),
+ 					"Remote sent unexpected NO/BYE instead of capability response");
+ 				client_proxy_failed(client, TRUE);
+ 				return -1;
+@@ -373,7 +372,8 @@ int managesieve_proxy_parse_line(struct client *client, const char *line)
+ 			ssl_flags = login_proxy_get_ssl_flags(client->login_proxy);
+ 			if ((ssl_flags & PROXY_SSL_FLAG_STARTTLS) != 0) {
+ 				if ( !msieve_client->proxy_starttls ) {
+-					client_log_err(client, "proxy: Remote doesn't support STARTTLS");
++					e_error(login_proxy_get_event(client->login_proxy),
++						"Remote doesn't support STARTTLS");
+ 						client_proxy_failed(client, TRUE);
+ 					return -1;
+ 				}
+@@ -413,7 +413,8 @@ int managesieve_proxy_parse_line(struct client *client, const char *line)
+ 			return 1;
+ 		}
+ 
+-		client_log_err(client, "proxy: Remote refused STARTTLS command");
++		e_error(login_proxy_get_event(client->login_proxy),
++			"Remote refused STARTTLS command");
+ 		client_proxy_failed(client, TRUE);
+ 		return -1;
+ 
+@@ -426,9 +427,9 @@ int managesieve_proxy_parse_line(struct client *client, const char *line)
+ 		if ( ret == 0 ) {
+ 			if ( response != MANAGESIEVE_RESPONSE_OK ) {
+ 				/* STARTTLS failed */
+-				client_log_err(client,
+-					t_strdup_printf("proxy: Remote STARTTLS failed: %s",
+-						str_sanitize(line, 160)));
++				e_error(login_proxy_get_event(client->login_proxy),
++					"Remote STARTTLS failed: %s",
++					str_sanitize(line, 160));
+ 				client_proxy_failed(client, TRUE);
+ 				return -1;
+ 			}
+@@ -463,9 +464,9 @@ int managesieve_proxy_parse_line(struct client *client, const char *line)
+ 			return 0;
+ 		}
+ 
+-		client_log_err(client, t_strdup_printf(
+-			"proxy: Remote XCLIENT failed: %s",
+-			str_sanitize(line, 160)));
++		e_error(login_proxy_get_event(client->login_proxy),
++			"Remote XCLIENT failed: %s",
++			str_sanitize(line, 160));
+ 		client_proxy_failed(client, TRUE);
+ 		return -1;
+ 
-- 
2.27.0
